<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">

</head>
<body>



  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">Product</th>
                              <th scope="col">Price</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">Total</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td>
                                  <h5>$360.00</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                      <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                          class="input-text qty">
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                          class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                          class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                  </div>
                              </td>
                              <td>
                                  <h5>$720.00</h5>
                              </td>
                          </tr>
                          
                          

                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->





</body>
</html>