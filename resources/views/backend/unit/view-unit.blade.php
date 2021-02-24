@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Manage Units</h1>
          </div>
          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Units</li>
              </ol>
          </div>
      </div>
    </div>
  

  <section class="content">
    <div class="container-fluid">
        <div class="row">
          <section class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Units List
                    <a class="btn btn-success btn-sm float-right" href="{{route('units.add')}}">
                        <i class="fa fa-plus-circle"></i> Add Unit</a>
                    </h3>
                </div>
                <div class="card-body">
                  <table id="example1" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>SL.</th>
                            <th>Unit Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($allData as $key => $unit)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$unit->name}}</td>
                            @php
                                $count_unit = App\Model\Product::where('unit_id',$unit->id)
                                ->count();
                            @endphp
                            <td>
                                <a href="{{route('units.edit',$unit->id)}}" title="Edit"
                                class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></a>
                                @if($count_unit<1)
                                <a href="{{route('units.delete',$unit->id)}}" title="Delete"
                                id="delete" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                  </table>
                </div>
            </div>
          </section>
        </div>
    </div>
  </section>

</div>

@endsection