@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Manage Purchase</h1>
          </div>
          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Purchase</li>
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
                    <h3>Pending Purchase List
                    {{-- <a class="btn btn-success btn-sm float-right" href="{{route('purchase.add')}}">
                        <i class="fa fa-plus-circle"></i> Add Purchase</a> --}}
                    </h3>
                </div>
                <div class="card-body  table-responsive">
                  <table width="100%" id="example1" class="table table-sm table-bordered table-hover">
                    <thead>
                        <tr>
                            <th width="5%">SL.</th>
                            <th width="5%">Purchase No</th>
                            <th width="10%">Date</th>
                            <th width="10%">Supplier Name</th>
                            <th width="10%">Category</th>
                            <th width="10%">Product Name</th>
                            <th width="20%">Description</th>
                            <th width="10%">Quantity</th>
                            <th width="5%">Unit Price</th>
                            <th width="5%">Buying Price</th>
                            <th width="5%">Status</th>
                            <th width="5%">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($allData as $key => $purchase)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$purchase->purchase_no}}</td>
                            <td>{{date('d-m-Y',strtotime($purchase->date))}}</td>
                            <td>{{$purchase['supplier']['name']}}</td>
                            <td>{{$purchase['category']['name']}}</td>
                            <td>{{$purchase['product']['name']}}</td>
                            <td>{{$purchase->description}}</td>
                            <td>
                              {{$purchase->buying_qty}}
                              {{$purchase['product']['unit']['name']}}
                            </td>
                            <td>{{$purchase->unit_price}}</td>
                            <td>{{$purchase->buying_price}}</td>
                            {{-- <td>{{$purchase['unit']['name']}}</td> --}}
                            <td>
                              @if($purchase->status=='0') <span style="background: #f1c639; padding:2px;">Pending</span>
                              @elseif($purchase->status=='1') <span style="background: #13c2c2; padding:2px;">Approved</span>
                              @endif
                            </td>
                            <td>
                              @if($purchase->status=='0')
                                <a href="{{route('purchase.approve',$purchase->id)}}" title="Approve"
                                id="approveBtn" class="btn btn-sm btn-success"><i class="fa fa-check-circle"></i></a>
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