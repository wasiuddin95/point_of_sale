@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Manage Suppliers</h1>
          </div>
          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Suppliers</li>
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
                    <h3>Suppliers List
                    <a class="btn btn-success btn-sm float-right" href="{{route('suppliers.add')}}">
                        <i class="fa fa-plus-circle"></i> Add Supplier</a>
                    </h3>
                </div>
                <div class="card-body">
                  <table id="example1" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>SL.</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Email:</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($allData as $key => $supplier)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$supplier->name}}</td>
                            <td>{{$supplier->mobile_no}}</td>
                            <td>{{$supplier->email}}</td>
                            <td>{{$supplier->address}}</td>
                            @php
                                $count_supplier = App\Model\Product::where('supplier_id',$supplier->id)
                                ->count();
                            @endphp
                            <td>
                                <a href="{{route('suppliers.edit',$supplier->id)}}" title="Edit"
                                class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></a>
                                @if($count_supplier<1)
                                <a href="{{route('suppliers.delete',$supplier->id)}}" title="Delete"
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