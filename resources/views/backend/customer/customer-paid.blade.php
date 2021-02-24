@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Manage Paid Customer</h1>
          </div>
          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Customer</li>
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
                    <h3>Paid Customers List
                    <a class="btn btn-success btn-sm float-right" href="{{route('customers.paid.pdf')}}"
                      target="_blank">  <i class="fa fa-download"></i> Download PDF</a>
                    </h3>
                </div>
                <div class="card-body">
                  <table id="example1" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>SL.</th>
                            <th>Customer Name</th>
                            <th>Invoice No</th>
                            <th>Date</th>
                            <th>Paid Amount</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                      @php
                          $total_paid = '0';
                      @endphp
                        @foreach($allData as $key => $payment)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>
                                {{$payment['customer']['name']}}<br>({{$payment['customer']['mobile_no']}})<br>
                                ({{$payment['customer']['address']}})
                            </td>
                            <td>Invoice No#{{$payment['invoice']['invoice_no']}}</td>
                            <td>{{date('d-m-Y',strtotime($payment['invoice']['date']))}}</td>
                            <td>{{$payment->paid_amount}}/Tk</td>
                            <td>
                                <a href="{{route('invoice.details.pdf',$payment->invoice_id)}}" target="_blank"
                                   title="Details" class="btn btn-sm btn-success"><i class="fa fa-eye"></i></a>
                            </td>
                            @php
                                $total_paid += $payment->paid_amount;
                            @endphp
                        </tr>
                        @endforeach
                    </tbody>
                  </table>

                  <table class="table table-bordered table-hover">
                    <tbody>
                      <tr>
                        <td colspan="5" style="text-align: right;"><strong>Grand Total</strong></td>
                        <td><strong>{{$total_paid}}/Tk</strong></td>
                      </tr>
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