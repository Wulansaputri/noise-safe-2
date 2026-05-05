<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Parents;

class ParentsController extends Controller
{
    public function index()
    {
        $parents = Parents::all();
        return view('admin.parents.index', compact('parents'));
    }

    public function create()
    {
        return view('admin.parents.create');
    }

    public function store(Request $request)
    {
        Parents::create($request->all());
        return redirect()->route('parents.index');
    }

    public function show($id)
    {
        $parent = Parents::findOrFail($id);
        return view('admin.parents.show', compact('parent'));
    }

    public function edit($id)
    {
        $parent = Parents::findOrFail($id);
        return view('admin.parents.edit', compact('parent'));
    }

    public function update(Request $request, $id)
    {
        $parent = Parents::findOrFail($id);
        $parent->update($request->all());
        return redirect()->route('parents.index');
    }

    public function destroy($id)
    {
        Parents::destroy($id);
        return redirect()->route('parents.index');
    }
}
