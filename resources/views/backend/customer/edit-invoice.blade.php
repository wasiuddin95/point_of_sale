@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Manage Credit Customer</h1>
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
                    <h3>Edit Customer Invoice (Invoice No#{{$payment['invoice']['invoice_no']}})
                    <a class="btn btn-success btn-sm float-right" href="{{route('customers.credit')}}">
                        <i class="fa fa-list"></i> Credit Customer List</a>
                    </h3>
                </div>
                <div class="card-body">
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td colspan="3"><strong>Customer Information:</strong></td>
                            </tr>
                            <tr>
                                <td width="30%"><strong>Name: </strong>{{$payment['customer']['name']}}</td>
                                <td width="30%"><strong>Mobile: </strong>{{$payment['customer']['mobile_no']}}</td>
                                <td width="40%"><strong>Address: </strong>{{$payment['customer']['address']}}</td>
                            </tr>
                            <tr>
    
                            </tr>
                        </tbody>
                    </table>
                    <form action="{{route('customers.update.invoice',$payment->invoice_id)}}" id="myForm" method="POST">
                        @csrf
                        <table border="1" width="100%" style="margin-bottom: 10px;" class="table table-bordered  table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th>Sl.</th>
                                    <th>Category</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $total_sum = '0';
                                    $invoice_details = App\Model\InvoiceDetail::where('invoice_id',$payment->invoice_id)->get();
                                @endphp
                                @foreach ($invoice_details as $key => $details)
                                  <tr class="text-center">
                                      <td>{{$key+1}}</td>
                                      <td>{{$details['category']['name']}}</td>
                                      <td>{{$details['product']['name']}}</td>
                                      <td>{{$details->selling_qty}}</td>
                                      <td>{{$details->unit_price}}</td>
                                      <td>{{$details->selling_price}}</td>
                                  </tr> 
                                  @php
                                      $total_sum += $details->selling_price;
                                  @endphp
                                @endforeach
                                <tr>
                                    <td colspan="5" class="text-right"><strong>Sub Total</strong></td>
                                    <td class="text-center"><strong>{{$total_sum}}</strong></td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="text-right">Discount</td>
                                  <td class="text-center"><strong>{{$payment->discount_amount}}</strong></td>
                              </tr>
                              <tr>
                                  <td colspan="5" class="text-right">Paid Amount</td>
                                  <td class="text-center"><strong>{{$payment->paid_amount}}</strong></td>
                              </tr>
                              <tr>
                                  <td colspan="5" class="text-right">Due Amount</td>
                                  <input type="hidden" name="new_paid_amount" value="{{$payment->due_amount}}">
                                  <td class="text-center"><strong>{{$payment->due_amount}}</strong></td>
                              </tr>
                              <tr>
                                  <td colspan="5" class="text-right"><strong>Grand Total</strong></td>
                                  <td class="text-center"><strong>{{$payment->total_amount}}</strong></td>
                              </tr>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label>Paid Status</label>
                                <select name="paid_status" id="paid_status" class="form-control">
                                  <option value="">Select Status</option>
                                  <option value="full_paid">Full Paid</option>
                                  <option value="partial_paid">Partial Paid</option>
                                </select>
                                <input type="text" name="paid_amount" class="form-control form-control-sm paid_amount"
                                placeholder="Enter Paid Amount" style="display: none;" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Date</label>
                                <input type="text" name="date" id="date" class="form-control  datepicker" 
                                placeholder="YYYY-MM-DD" readonly>
                            </div>
                            <div class="form-group col-md-3" style="padding-top:31px;">
                                <button type="submit" class="btn btn-primary">
                                    Invoice update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
          </section>
        </div>
    </div>
  </section>

</div>

<script type="text/javascript">
    //   Paid Status
  $(document).on('change','#paid_status',function(){
      var paid_status = $(this).val();
      if(paid_status == 'partial_paid'){
          $('.paid_amount').show();
      }else{
          $('.paid_amount').hide();
      }
  });
</script>

<script type="text/javascript">
    $('.datepicker').datepicker({
        uiLibrary: 'bootstrap4',
        format : 'yyyy-mm-dd'
    });
</script>

<script type="text/javascript">
    $(function () {
    $('#myForm').validate({
      rules: {
        paid_status: {
            required: true,
        },
        date: {
            required: true,
        }
        },
        messages: {
        paid_status: {
            required: "Please enter paid amount!! ",
        },
        mobile_no: {
            required: "Please enter valid date!! ",
        }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
        error.addClass('invalid-feedback');
        element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
        $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
        $(element).removeClass('is-invalid');
        }
    });
    });
</script>

@endsection