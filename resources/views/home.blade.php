@extends('layouts.app')
<style type="text/css">
    .avatar{
        border-radius: 100%;
        max-width: 100px;
    }
</style>
@section('content')
<div class="container">
    <div class="row" style="text-align: center;">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
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
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="col-md-4">
                        @if(!empty($profile))
                            <img src="{{ $profile->profile_pic }}" alt="" class="avatar" />
                        @else
                            <img src="{{ url('images/avatar.png') }}" alt="" class="avatar" />

                        @endif
                        @if(!empty($profile))
                            <p class="lead">{{ $profile->name}}</p>
                        @else
                            <p>Guest</p>
                        @endif
                        @if(!empty($profile))
                            <p class="">{{ $profile->designation}}</p>
                        @else
                            <p></p>
                        @endif
                        
                    </div>
                    <div class="col-md-8">

                        @if(count($posts)>0)
                            @foreach($posts->all() as $post)
                                <h4>{{ $post->post_title}}</h4>
                                <img src="{{$post->post_image}}" alt="" style="max-width: 470px;"/>
                                <p>{{substr($post->post_body,0,150)}}......</p>
                                <ul class="nav nav-pills">
                                    <li role="presentation">
                                        <a href="{{url("/view/{$post->id}")}}">
                                            <span class="fa fa-eye"> View</span>
                                        </a>
                                    </li>
                                    @if(Auth::user()->type == '1')
                                        <li role="presentation">
                                            <a href="{{url("/edit/{$post->id}")}}">
                                                <span class="fa fa-edit"> Edit</span>
                                            </a>
                                        </li>
                                        <li role="presentation">
                                            <a href="{{url("/delete/{$post->id}")}}">
                                                <span class="fa fa-trash-o"> Delete</span>
                                            </a>
                                        </li>
                                    @endif    
                                </ul>
                                <cite style="float:left;">Posted on: {{date('M j, Y H:i', strtotime($post->updated_at))}}</cite>
                                <br/>
                                <hr/>
                            @endforeach
                        @else
                            <p>No Posts to Display</p>
                        @endif
                        {{$posts->links()}}
                    </div>    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
