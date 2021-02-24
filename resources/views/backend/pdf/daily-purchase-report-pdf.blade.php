<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Daily Invoice PDF Report</title>
    <link rel="stylesheet" href="{{asset('public/backend')}}/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td width="25%"></td>
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
                           <td width="15%"></td>
                           <td><u><strong><span style="font-size:20px;">
                            Daily Purchase Report({{date('d-m-Y',strtotime($start_date))}} - 
                            {{date('d-m-Y',strtotime($end_date))}})</span></strong></u>
                           </td>
                           <td width=""></td>
                       </tr>
                   </tbody>
               </table>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <table width="100%" border="1">
              <thead>
                  <tr>
                      <th>SL.</th>
                      <th>Purchase No</th>
                      <th>Date</th>
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
                  @foreach($allData as $key => $purchase)
                  <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$purchase->purchase_no}}</td>
                      <td>{{date('d-m-Y',strtotime($purchase->date))}}</td>
                      <td>{{$purchase['product']['name']}}</td>
                      <td>
                        {{$purchase->buying_qty}}
                        {{$purchase['product']['unit']['name']}}
                      </td>
                      <td>{{$purchase->unit_price}}</td>
                      <td>{{$purchase->buying_price}}</td>
                      {{-- <td>{{$purchase['unit']['name']}}</td> --}}
                      @php
                          $total_sum += $purchase->buying_price;
                      @endphp
                  </tr>
                  @endforeach
                  <tr>
                      <td colspan="6" style="text-align: right;"><strong>Grand Total</strong></td>
                      <td><strong>{{$total_sum}}</strong></td>
                  </tr>
              </tbody>
            </table>
            <br>
            @php
                $date = new DateTime('now', new DateTimezone('Asia/Dhaka'));
            @endphp
            <i>Printing time : {{$date->format('F j, Y, g:i a')}}</i>
            
          </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table border="0" width="100%">
                    <tbody>
                        <tr>
                            <td style="width: 40%;">
                            </td>
                            <td style="width: 20%;"></td>
                            <td style="width: 40%; text-align: center;">
                                <p style="border-bottom: 1px solid #000; text-align: center;">Owner Signature</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>