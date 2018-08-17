<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;
use App\Post;
use App\Category;
use App\Like;
use App\Dislike;
use App\Comment;
use Auth;

class PostController extends Controller
{
    public function post() {
    	$categories = Category::all();
        return view('posts.post',['categories' => $categories]);
    }

    public function addPost(Request $request) {
    	$this->validate($request, [
    		'post_title' => 'required',
    		'post_body' => 'required',
    		'category_id' => 'required',
    		'post_image' => 'required',
    	]);
        $posts = new post;
        $posts->post_title = $request->input('post_title');
        $posts->post_body = $request->input('post_body');
        $posts->category_id = $request->input('category_id');
        $posts->user_id = Auth::user()->id;
        if(Input::hasFile('post_image')){
        	$file = Input::file('post_image');
        	$file->move(public_path(). '/posts',$file->getClientOriginalName());
        	$url = URL::to("/"). '/posts/'.$file->getClientOriginalName();
		}
        $posts->post_image = $url;
		$posts->save();
		return redirect('/home')->with('response', 'Post Published Successfully');        
    }

    public function view($post_id)
    {
    	$posts = Post::where('id', '=', $post_id)->get();
    	$categories = Category::all();
    	$like_count = Like::where('post_id', '=', $post_id)->get();
    	$dislike_count = Dislike::where('post_id', '=', $post_id)->get();
    	$comments  = Comment::where('post_id', '=', $post_id)->get();
    	return view('posts.view',['posts' => $posts, 'categories' => $categories,'like_count' => $like_count,'dislike_count' => $dislike_count, 'comments' => $comments]);
    }

    public function edit($post_id)
    {
    	$posts = Post::find($post_id);
    	$category = Category::find($posts->category_id);
    	$categories = Category::all();
    	return view('posts.edit',['posts' => $posts, 'category' => $category, 'categories' => $categories]);
    }

    public function editPost(Request $request, $post_id) {
    	$this->validate($request, [
    		'post_title' => 'required',
    		'post_body' => 'required',
    		'category_id' => 'required',
    		'post_image' => 'required',
    	]);
        $posts = new post;
        $posts->post_title = $request->input('post_title');
        $posts->post_body = $request->input('post_body');
        $posts->category_id = $request->input('category_id');
        $posts->user_id = Auth::user()->id;
        if(Input::hasFile('post_image')){
        	$file = Input::file('post_image');
        	$file->move(public_path(). '/posts',$file->getClientOriginalName());
        	$url = URL::to("/"). '/posts/'.$file->getClientOriginalName();
		}
        $posts->post_image = $url;
        $data = array(
        	'post_title' => $posts->post_title,
        	'post_body'	=> $posts->post_body,
        	'post_image' => $posts->post_image,
        	'user_id' => $posts->user_id,
        	'category_id' => $posts->category_id
        );
        Post::where('id',$post_id)->update($data);
		$posts->update();
		return redirect('/home')->with('response', 'Post updated Successfully');        
    }

    public function deletePost($post_id)
    {
    	Post::where('id',$post_id)->delete();
		return redirect('/home')->with('response', 'Post deleted Successfully');        
    }

    public function category($cat_id)
    {
    	$posts = Post::where('category_id', '=', $cat_id)->get();
    	$categories = Category::all();
    	return view('categories.categoriesposts',['posts' => $posts, 'categories' => $categories]);
    }

    public function like($post_id)
    {
    	$loggedin_user = Auth::user()->id;
    	$like_user = Like::where(['user_id' => $loggedin_user, 'post_id' => $post_id])->first();
    	if(empty($like_user->user_id)){
    		$user_id = Auth::user()->id;
    		$email = Auth::user()->email;
    		$post_id = $post_id;
    		$like = new Like;
    		$like->user_id = $user_id;
    		$like->email = $email;
    		$like->post_id = $post_id;
    		$like->save();
    		return redirect("/view/{$post_id}");
    	}else{
    		return redirect("/view/{$post_id}");
    	}
    }

    public function dislike($post_id)
    {
    	$loggedin_user = Auth::user()->id;
    	$dislike_user = Dislike::where(['user_id' => $loggedin_user, 'post_id' => $post_id])->first();
    	if(empty($dislike_user->user_id)){
    		$user_id = Auth::user()->id;
    		$email = Auth::user()->email;
    		$post_id = $post_id;
    		$dislike = new Dislike;
    		$dislike->user_id = $user_id;
    		$dislike->email = $email;
    		$dislike->post_id = $post_id;
    		$dislike->save();
    		return redirect("/view/{$post_id}");
    	}else{
    		return redirect("/view/{$post_id}");
    	}
    }

    public function comment(Request $request, $post_id)
    {
    	$this->validate($request, [
    		'comment' => 'required'
    	]);
        $comments = new comment;
        $comments->comment = $request->input('comment');
        $comments->user_id = Auth::user()->id;
        $comments->post_id = $post_id;
        $comments->save();
		return redirect("/view/{$post_id}")->with('response', 'Comment Posted Successfully');        
    }
}
