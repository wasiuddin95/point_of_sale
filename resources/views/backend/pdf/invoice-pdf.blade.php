<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice PDF</title>
    <link rel="stylesheet" href="{{asset('public/backend')}}/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td><strong>Invoice No: #{{$invoice->invoice_no}}</strong></td>
                            <td>
                                <span style="font-size: 20px;background: #ddd; padding: 3px 10px 3px 10px;
                                color: #000;">Wasi Uddin Business LTD.</span>
                                    <br> Malibagh Chowdhury Para,Dhaka
                            </td>
                            <td><span>Showroom No: 01676339605 <br>
                                Owner No: 01643384445 
                            </span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <hr style="margin-bottom: 0px;">
               <table>
                   <tbody>
                       <tr>
                           <td width="45%"></td>
                           <td><u><strong><span style="font-size:20px;">Customer Invoice</span></strong></u></td>
                           <td width="15%"></td>
                       </tr>
                   </tbody>
               </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                @php
                $payment = App\Model\Payment::where('invoice_id',$invoice->id)->first();
                @endphp
                <table width="100%">
                    <tbody>
                        <tr>
                            <td width="30%"><strong>Name: </strong>{{$payment['customer']['name']}}</td>
                            <td width="30%"><strong>Mobile: </strong>{{$payment['customer']['mobile_no']}}</td>
                            <td width="40%"><strong>Address: </strong>{{$payment['customer']['address']}}</td>
                        </tr>
                        <tr>

                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table border="1" width="100%" class="table table-bordered  table-hover">
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
                        @endphp
                        @foreach ($invoice['invoice_details'] as $key => $details)
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
                          <td class="text-center"><strong>{{$payment->due_amount}}</strong></td>
                      </tr>
                      <tr>
                          <td colspan="5" class="text-right"><strong>Grand Total</strong></td>
                          <td class="text-center"><strong>{{$payment->total_amount}}</strong></td>
                      </tr>
                    </tbody>
                </table>
                @php
                    $date = new DateTime('now', new DateTimezone('Asia/Dhaka'));
                @endphp
                <br>
                <i>Printing Time: {{$date->format('F j, Y, g:i a')}}</i>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <hr style="margin-bottom: 0px;">
                <table border="0" width="100%">
                    <tbody>
                        <tr>
                            <td style="width: 40%;">
                                <p style="text-align: center; margin-left: 20px;">Customer Signature</p>
                            </td>
                            <td style="width: 20%;"></td>
                            <td style="width: 40%; text-align: center;">
                                <p>Seller Signature</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>