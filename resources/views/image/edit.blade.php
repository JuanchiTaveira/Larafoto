@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        Editar publicación
                    </div>

                    <div class="card-body">
                        <form action="{{ route('image.update') }}" enctype="multipart/form-data" method="post">
                            @csrf

                            <div class="form-group row">
                                
                                <input type="hidden" name="image_id" value="{{ $image->id }}">
                                
                                <label for="image_path" class="col-md-3 text-md-right">Imágen</label>
                                <div class="col-md-7">

                                    <div class="image-container image-detail pub_image_detail">
                                        <img src="{{ route('image.file', ['filename' => $image->image_path]) }}" class="avatar">
                                    </div>
                                    
                                    <input class="{{ $errors->has('image_path') ? 'is-invalid' : '' }}" id="image_path"
                                        type="file" name="image_path">

                                    @if ($errors->has('image_path'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('image_path') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-md-3 text-md-right">Descripción</label>
                                <div class="col-md-7">
                                    <textarea id="description" type="text" name="description"
                                        class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}">{{ $image->description }}</textarea>

                                    @if ($errors->has('description'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('description') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 offset-md-3">
                                    <input type="submit" class="btn btn-primary" value="Actualizar imágen">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
