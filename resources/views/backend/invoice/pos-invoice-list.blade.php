@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Manage Invoice</h1>
          </div>
          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Invoice</li>
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
                    <h3>Invoice List
                    {{-- <a class="btn btn-success btn-sm float-right" href="{{route('invoice.add')}}">
                        <i class="fa fa-plus-circle"></i> Add Invoice</a> --}}
                    </h3>
                </div>
                <div class="card-body table-responsive">
                  <table id="example1" width="100%" cellspacing="0" class="table table-sm table-bordered  table-hover ">
                    <thead>
                        <tr>
                            <th>SL.</th>
                            <th>Customer Name</th>
                            <th>Invoice No</th>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($allData as $key => $invoice)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>
                              {{$invoice['payment']['customer']['name']}}<br>
                              ({{$invoice['payment']['customer']['mobile_no']}}<br>
                              {{$invoice['payment']['customer']['address']}})
                            </td>
                            <td>Invoice-No#{{$invoice->invoice_no}}</td>
                            <td>{{date('d-m-Y',strtotime($invoice->date))}}</td>
                            <td>{{$invoice->description}}</td>
                            <td>{{$invoice['payment']['total_amount']}}</td>
                            <td>
                                <a title="Print" class="btn btn-sm btn-success" href=
                                "{{route('invoice.print',$invoice->id)}}" target="_blank"><i class="fa fa-print"></i></a>
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