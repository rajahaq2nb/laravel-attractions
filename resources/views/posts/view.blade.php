@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row" style="text-align: center;">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Post View</div>

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
                                <ul class="nav nav-pills">
                                    <li role="presentation">
                                        <a href="{{url("/like/{$post->id}")}}">
                                            <span class="fa fa-thumbs-up"> Like({{count($like_count)}})</span>
                                        </a>
                                    </li>
                                    <li role="presentation">
                                        <a href="{{url("/dislike/{$post->id}")}}">
                                            <span class="fa fa-thumbs-down"> Dislike({{count($dislike_count)}})</span>
                                        </a>
                                    </li>
                                    <li role="presentation">
                                        <a href="">
                                            <span class="fa fa-comment-o"> Comments({{count($comments)}})</span>
                                        </a>
                                    </li>
                                </ul>
                            @endforeach
                        @else
                            <p>No Posts to Display</p>
                        @endif
                        @if (count($errors) >0 )
                            <div class="alert alert-danger">
                                {{$errors}}
                            </div>
                        @endif
                        
                        @if (session('response'))
                            <div class="alert alert-success">
                                {{session('response')}}
                            </div>
                        @endif
                        <form class="form-horizontal" method="POST" action="{{ url("/comment/{$post->id}") }}">
                            {{ csrf_field() }}

                            <div class="form-group">
                                <textarea id="comment" rows="6" class="form-control" name="comment" required autofocus></textarea>    
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">
                                    Post Comment
                                </button>
                            </div>
                        </form>
                        <h3>Comments</h3>
                        @if(count($comments)>0)
                            @foreach($comments->all() as $comment)
                                <hr/>
                                <br/>
                                <p>{{$comment->comment}}.</p>
                                <p>Posted by: {{Auth::user()->name}}</p>
                                <cite style="float:left;">Posted on: {{date('M j, Y H:i', strtotime($comment->created_at))}}</cite>
                                <br/>
                                <hr/>
                            @endforeach    
                        @else
                            <p>No comments added</p>
                        @endif
                    </div>      
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
