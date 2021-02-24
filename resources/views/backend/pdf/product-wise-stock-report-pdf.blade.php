<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Wise Stock PDF Report</title>
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
                           <td width="35%"></td>
                           <td><u><strong><span style="font-size:20px;">Product Wise Stock Report</span></strong></u>
                           </td>
                           <td width="15%"></td>
                       </tr>
                   </tbody>
               </table>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <br>
            <table border="1" width="100%" class="table table-bordered table-hover">
              <thead>
                  <tr>
                      <th>Supplier Name</th>
                      <th>Category</th>
                      <th>Product Name</th>
                      <th>In.Qty</th>
                      <th>Out.Qty</th>
                      <th>Stock</th>
                      <th>Unit</th>
                  </tr>
              </thead>
              <tbody>
                @php
                    $buying_total = App\Model\Purchase::where('category_id',$product->category_id)->
                    where('product_id',$product->id)->where('status','1')->sum('buying_qty');
                    $selling_total = App\Model\InvoiceDetail::where('category_id',$product->category_id)->
                    where('product_id',$product->id)->where('status','1')->sum('selling_qty');
                @endphp
                  <tr>
                      <td>{{$product['supplier']['name']}}</td>
                      <td>{{$product['category']['name']}}</td>
                      <td>{{$product->name}}</td>
                      <td>{{$buying_total}}</td>
                      <td>{{$selling_total}}</td>
                      <td>{{$product->quantity}}</td>
                      <td>{{$product['unit']['name']}}</td>
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