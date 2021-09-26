<?php

namespace App\Http\Controllers;

use App\Models\Image;
use App\Models\Like;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{
    public function __construct()
    {

        $this->middleware('auth');
    }

    public function index()
    {

        $likes = Like::where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')
            ->paginate(5);

        return view('like.index', [
            'likes' => $likes
        ]);
    }

    public function like($image_id)
    {

        //Recoger datos del usuario y la imagen
        $user = \Auth::user();

        $isset_like = Like::where('user_id', $user->id)
            ->where('image_id', $image_id)
            ->count();

        if ($isset_like == 0) {
            $like = new Like();
            $like->user_id = $user->id;
            $like->image_id = (int)$image_id;

            $like->save();

            return response()->json([
                'like' => $like
            ]);
        } else {

            return response()->json([
                'message' => 'El like ya existe'
            ]);
        }
    }

    public function dislike($image_id)
    {

        //Recoger datos del usuario y la imagen
        $user = \Auth::user();

        $like = Like::where('user_id', $user->id)
            ->where('image_id', $image_id)
            ->first();

        if ($like) {

            $like->delete();

            return response()->json([
                'like' => $like,
                'message' => 'Has dado dislike correctamente'
            ]);
        } else {

            return response()->json([
                'message' => 'El like no existe'
            ]);
        }
    }
}
