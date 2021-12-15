@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">

                @include('includes.message')

                <div class="card pub_image">
                    <div class="card-header">

                        @if ($image->user->image)

                            <div class="container-avatar">
                                <img src="{{ route('user.avatar', ['filename' => $image->user->image]) }}"
                                    class="avatar">
                            </div>

                        @endif

                        <div class="data_user">
                            <a href="{{ route('profile', ['id' => $image->user_id]) }}" class="a-image-detail">
                                {{ $image->user->name . ' ' . $image->user->surname }}
                                <span class="nickname">
                                    {{ ' | @' . $image->user->nick }}
                                </span>
                            </a>
                        </div>

                    </div>

                    <div class="card-body">
                        <div class="image-container image-detail pub_image_detail">
                            <img src="{{ route('image.file', ['filename' => $image->image_path]) }}"
                                class="">
                        </div>

                        <div class="likes-detail">

                            {{-- Compruebo si el user le dio like a la imagen --}}

                            <?php $user_like = false; ?>

                            @foreach ($image->likes as $like)

                                @if ($like->user_id == Auth::user()->id)
                                    <?php $user_like = true; ?>
                                @endif

                            @endforeach

                            @if ($user_like == true)
                                <img src="{{ asset('img/heart-red.png') }}" data-id="{{ $image->id }}"
                                    class="btn-dislike">
                            @else
                                <img src="{{ asset('img/heart-black.png') }}" data-id="{{ $image->id }}"
                                    class="btn-like">
                            @endif

                            <p class="likes-count">
                                {{ count($image->likes) }} Me gusta
                            </p>

                        </div>

                        @if (Auth::user() && Auth::user()->id == $image->user->id)

                            <div class="actions">
                                
                                <a href="{{ route('image.edit' , ['id'=>$image->id]) }}" class="btn btn-sm btn-primary">Editar</a>

                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal"
                                    data-target="#exampleModal">
                                    Eliminar
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro?</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Si eliminas ésta imágen nunca podrás recuperarla. ¿Seguro que quieres eliminarla?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cancelar</button>
                                                    <a href="{{ route('image.delete', ['id' => $image->id]) }}"
                                                        class="btn btn-danger">Borrar definitivamente</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        @endif

                        <div class="clearfix"></div>

                        <div class="description">
                            <span class="nickname"> {{ '@' . $image->user->nick }} </span>
                            <span class="nickname date">
                                {{ ' | ' . $image->created_at->locale('es_ES')->diffForHumans(null, false, false, 1) }}
                            </span>
                            <p> {{ $image->description }} </p>
                        </div>

                        <div class="comments">
                            <h2>Comentarios ({{ count($image->comments) }})</h2>

                            @foreach ($image->comments as $comment)
                                <div class="comment">
                                    <span class="nickname"> {{ '@' . $comment->user->nick }} </span>
                                    <span class="nickname date">
                                        {{ ' | ' . $comment->created_at->locale('es_ES')->diffForHumans(null, false, false, 1) }}
                                    </span>
                                    <p class="content"> {{ $comment->content }} </p>

                                    @if ((Auth::check() && $comment->user_id == Auth::user()->id) || (Auth::check() && $comment->image->user_id == Auth::user()->id))

                                        <a href="{{ route('comment.delete', ['id' => $comment->id]) }}"
                                            class="btn btn-sm btn-danger btn-delete">
                                            Eliminar
                                        </a>

                                    @endif

                                </div>
                            @endforeach

                            <hr>
                            <form action="{{ route('comment.save') }}" method="post">
                                @csrf

                                <input type="hidden" name="image_id" value="{{ $image->id }}">
                                <p>
                                    <textarea class="form-control {{ $errors->has('content') ? 'is-invalid' : '' }}"
                                        name="content"></textarea>

                                    @if ($errors->has('content'))
                                        <br>
                                        <span class=" invalid-feedback alert alert-danger" role="alert">
                                            <strong>{{ $errors->first('content') }}</strong>
                                        </span>
                                        <br>

                                    @endif
                                </p>
                                <button type="submit" class="btn btn-success">Enviar</button>
                            </form>
                            <br>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
