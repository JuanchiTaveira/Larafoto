<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Comment;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function save(Request $request){

        //Validacion
        $validate = $this->validate($request , [
            'image_id'=>'integer|required',
            'content'=>'string|required'
        ]);

        //Recoger datos
        $content = $request->input('content');
        $image_id = $request->input('image_id');
        $user = Auth::user();

        //Asigno los valores a mi nuevo objeto a guardar
        $comment = new Comment();

        $comment->user_id = $user->id;
        $comment->image_id = $image_id;
        $comment->content = $content;

        //Guardar en la BD
        $comment->save();

        //Redireccion
        return redirect()->route('image.detail' , ['id' => $image_id])
                         ->with([
                             'message'=>'Has publicado tu comentario correctamente.'
                         ]);
    }

    public function delete($id){
        //Conseguir datos del user identificado
        $user = Auth::user();

        //Conseguir objeto del comentario
        $comment = Comment::find($id);

        //Comprobar si soy el dueño del comentario o el dueño de la publicacion
        if(($user && $comment->user_id == $user->id) || ($user && $comment->image->user_id == $user->id)){

            $comment->delete();

            return redirect()->route('image.detail' , ['id' => $comment->image_id])
                             ->with([
                                 'message'=>'Has eliminado tu comentario correctamente.'
                             ]);
        }else{
            
            return redirect()->route('image.detail' , ['id' => $comment->image_id])
                             ->with([
                                 'message'=>'No fue posible borrar el comentario.'
                             ]);
        }
    }
}
