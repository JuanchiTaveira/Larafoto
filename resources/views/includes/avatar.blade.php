<div class="container-avatar">
    @if (Auth::user()->image)
        <img src="{{ route('user.avatar', ['filename' => Auth::user()->image]) }}" class="avatar">
    @else
        <img src="{{ asset('img/avatar1.png') }}" class="avatar">
    @endif
</div>
