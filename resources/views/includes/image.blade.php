<div class="card pub_image">
    <div class="card-header">

        @if ($image->user->image)

            <div class="container-avatar">
                <img src="{{ route('user.avatar', ['filename' => $image->user->image]) }}" class="avatar">
            </div>

        @endif

        <div class="data_user">
            <a href="{{ route('profile' , ['id'=>$image->user_id]) }}" class="a-image-detail">
                {{ $image->user->name . ' ' . $image->user->surname }}
                <span class="nickname">
                    {{ ' | @' . $image->user->nick }}
                </span>
            </a>
        </div>

    </div>

    <div class="card-body">
        <div class="image-container">
            <img src="{{ route('image.file', ['filename' => $image->image_path]) }}">
        </div>

        <div class="likes">

            {{-- Compruebo si el user le dio like a la imagen --}}

            <?php $user_like = false; ?>

            @foreach ($image->likes as $like)

                @if ($like->user_id == Auth::user()->id)
                    <?php $user_like = true; ?>
                @endif

            @endforeach

            @if ($user_like == true)
                <img src="{{ asset('img/heart-red.png') }}" data-id="{{ $image->id }}" class="btn-dislike">
            @else
                <img src="{{ asset('img/heart-black.png') }}" data-id="{{ $image->id }}" class="btn-like">
            @endif

            <p class="likes-count">
                {{ count($image->likes) }} Me gusta
            </p>

        </div>

        <div class="description">
            <span class="nickname"> {{ '@' . $image->user->nick }} </span>

            <span class="nickname date">
                {{ ' | ' . $image->created_at->locale('es_ES')->diffForHumans(null, false, false, 1) }}
            </span>

            <p class="description_content"> {{ $image->description }} </p>
        </div>

        <div class="comments">
            <a href="{{ route('image.detail', ['id' => $image->id]) }}" class="btn btn-sm btn-warning btn-comments">
                Comentarios ({{ count($image->comments) }})
            </a>
        </div>
    </div>
</div>
