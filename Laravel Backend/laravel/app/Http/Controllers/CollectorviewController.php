<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;
class CollectorviewController extends Controller {
public function index(){
$users = DB::select('select * from users');
return view('collector',['users'=>$users]);
}
}


/*//retrive data
Route::get('dashboard/collector','CollectorviewController@index');*/