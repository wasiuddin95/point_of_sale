@extends('backend.layouts.master')
@section('content')
{{-- Content Wrapper, Contains page content --}}
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="row mb-2">
          <div class="col-sm-6">
            <h2 class="m-0 text-dark">Manage Supplier/Product Wise Stock</h2>
          </div>
          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Products</li>
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
                    <h3>Select Criteria
                    {{-- <a class="btn btn-success btn-sm float-right" href="{{route('stock.report.pdf')}}"
                     target="_blank" >   <i class="fa fa-download"></i> Download PDF</a> --}}
                    </h3>
                </div>
                <div class="card-body">
                  <div class="row">
                      <div class="col-sm-12 text-center">
                          <strong>Supplier wise report</strong>
                          <input type="radio" name="supplier_product_wise" value="supplier_wise" 
                          class="search_value">&nbsp;&nbsp;
                          <strong>Product wise report</strong>
                          <input type="radio" name="supplier_product_wise" value="product_wise" 
                          class="search_value">
                      </div>

                  </div>
                  <div class="show_supplier" style="display: none;">
                      <form action="{{route('stock.report.supplier.wise.pdf')}}" method="GET"
                       id="supplierWiseForm" target="_blank">
                          <div class="form-row">
                              <div class="col-sm-8">
                                  <label for="">Supplier Name</label>
                                  <select name="supplier_id" class="form-control select2">
                                    <option value="">Select Supplier</option>
                                    @foreach ($suppliers as $supplier)
                                       <option value="{{$supplier->id}}">{{$supplier->name}}</option> 
                                    @endforeach
                                  </select>
                              </div>
                              <div class="col-sm-4" style="padding-top: 31px;">
                                  <button type="submit" class="btn btn-primary">Search</button>
                              </div>
                          </div>
                      </form>
                  </div>
                  <div class="show_product" style="display: none;">
                      <form action="{{route('stock.report.product.wise.pdf')}}" method="GET"
                       id="productWiseForm" target="_blank">
                          <div class="form-row">      
                            <div class="col-sm-4">
                                <label>Category Name</label>
                                <select name="category_id" id="category_id" class="form-control select2">
                                    <option value="">Select Category</option>
                                    @foreach ($categories as $category)
                                    <option value="{{$category->id}}">{{$category->name}}</option>
                                    @endforeach
                                </select>
                            <font style="color: red;">{{($errors->has('category_id'))?($errors->first('category_id')):''}}</font>
                            </div>
                            <div class="col-sm-6">
                                <label>Product Name</label>
                                <select name="product_id" id="product_id" class="form-control select2">
                                    <option value="">Select Product</option>
                                </select>
                            <font style="color: red;">{{($errors->has('product_id'))?($errors->first('product_id')):''}}</font>
                            </div>
                              <div class="col-sm-2" style="padding-top: 31px;">
                                  <button type="submit" class="btn btn-primary">Search</button>
                              </div>
                          </div>
                      </form>
                  </div>
                </div>
            </div>
          </section>
        </div>
    </div>
  </section>

</div>

<script type="text/javascript">
  $(document).on('change','.search_value',function(){
      var search_value = $(this).val();
      if (search_value == 'supplier_wise') {
          $('.show_supplier').show();
      }else{
        $('.show_supplier').hide();
      }
      if (search_value == 'product_wise') {
          $('.show_product').show();
      }else{
        $('.show_product').hide();
      }
  });
</script>

<script type="text/javascript">
    $(function () {
    $('#supplierWiseForm').validate({
      ignore:[],
      errorPlacement: function(error, element){
          if (element.attr("name") == "supplier_id" ){ error.insertAfter(
              element.next());}
              else{error.insertAfter(element);}
      }, 
      errorClass:'text-danger',
      validClass:'text-success',
      rules: {
        supplier_id: {
            required: true,
        }
        },
        messages: {
        
        },
    });
    });
</script>

<script type="text/javascript">
    $(function () {
    $('#productWiseForm').validate({
      ignore:[],
      errorPlacement: function(error, element){
          if (element.attr("name") == "category_id" ){ error.insertAfter(
              element.next());}
          else if (element.attr("name") == "product_id" ){ error.insertAfter(
              element.next());}
              else{error.insertAfter(element);}
      }, 
      errorClass:'text-danger',
      validClass:'text-success',
      rules: {
        category_id: {
            required: true,
        },
        product_id: {
            required: true,
        }
        },
        messages: {
        
        },
    });
    });
</script>

<script type="text/javascript">
    $(function(){
        $(document).on('change','#category_id',function(){
            var category_id = $(this).val();
            $.ajax({
                url:"{{route('get-product')}}",
                type:"GET",
                data:{category_id:category_id},
                success:function(data){
                    var html = '<option value="">Select Product</option>';
                    $.each(data,function(key,v){
                        html +='<option value="'+v.id+'">'+v.name+'</option>';
                    });
                    $('#product_id').html(html);
                }
            });
        });
    });
  </script>

@endsection