@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row" style="text-align: center;">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Category View</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="col-md-4">
                        <ul class="list-group">
                            @if(count($categories)>1)
                                @foreach($categories->all() as $category)
                                    <li class="list-group-item"><a href="{{ url("/category/{$category->id}")}}">{{$category->category}}</a></li>
                                @endforeach
                            @else
                                <p>No Categories Found!</p>
                            @endif
                        </ul>
                    </div>
                    <div class="col-md-8">

                        @if(count($posts)>0)
                            @foreach($posts->all() as $post)
                                <h4>{{ $post->post_title}}</h4>
                                <img src="{{$post->post_image}}" alt="" style="max-width: 470px;"/>
                                <p>{{$post->post_body}}</p>

                                <cite style="float:left;">Posted on: {{date('M j, Y H:i', strtotime($post->updated_at))}}</cite>
                                <br>
                            @endforeach
                        @else
                            <p>No Posts to Display</p>
                        @endif
                    </div>      
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
