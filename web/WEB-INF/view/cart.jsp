<%-- 
    Document   : cart
    Created on : 7-jul-2016, 13:11:24
    Author     : Sonja
--%>

<div id="singleColumn">

    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <p>Your shopping cart contains ${cart.numberOfItems} items.</p>
        </c:when>
        <c:when test="${cart.numberOfItems == 1}">
            <p>Your shopping cart contains ${cart.numberOfItems} item.</p>
        </c:when>
        <c:otherwise>
            <p>Your shopping cart is empty.</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="viewCart?clear=true" class="bubble hMargin">clear cart</a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                <c:when test="${!empty selectedCategory}">
                    category
                </c:when>
                <%-- otherwise send user to welcome page --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <a href="${value}" class="bubble hMargin">continue shopping</a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="checkout" class="bubble hMargin">proceed to checkout &#x279f;</a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <h4 id="subtotal">subtotal: &euro; ${cart.subtotal}</h4>

      <table id="cartTable">

        <tr class="header">
            <th>product</th>
            <th>name</th>
            <th>price</th>
            <th>quantity</th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.product}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.productImagePath}${product.name}.png"
                   alt="${product.name}">
            </td>

            <td>${product.name}</td>

            <td>
                &euro; ${cartItem.total}
                <br>
                <span class="smallText">( &euro; ${product.price} / unit )</span>
            </td>

            <td>
                <form action="updateCart" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="update">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>

<!--<div id="centerColumn">

    <p>Your shopping cart contains x items.</p>

    <div id="actionBar">
        <a href="#" class="bubble hMargin">clear cart</a>
        <a href="#" class="bubble hMargin">continue shopping</a>
        <a href="#" class="bubble hMargin">proceed to checkout</a>
    </div>

    <h4 id="subtotal">[ subtotal: xxx ]</h4>

    <table id="cartTable">

        <tr class="header">
            <th>product</th>
            <th>name</th>
            <th>price</th>
            <th>quantity</th>
        </tr>

        <tr>
            <td class="lightBlue">
                <img src="#" alt="product image">
            </td>
            <td class="lightBlue">[ product name ]</td>
            <td class="lightBlue">[ price ]</td>
            <td class="lightBlue">

                <form action="updateCart" method="post">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="1"
                           name="quantity">
                    <input type="submit"
                           name="submit"
                           value="update button">
                </form>
            </td>
        </tr>

        <tr>
            <td class="white">
                <img src="#" alt="product image">
            </td>
            <td class="white">[ product name ]</td>
            <td class="white">[ price ]</td>
            <td class="white">

                <form action="updateCart" method="post">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="1"
                           name="quantity">
                    <input type="submit"
                           name="submit"
                           value="update button">
                </form>
            </td>
        </tr>

        <tr>
            <td class="lightBlue">
                <img src="#" alt="product image">
            </td>
            <td class="lightBlue">[ product name ]</td>
            <td class="lightBlue">[ price ]</td>
            <td class="lightBlue">

                <form action="updateCart" method="post">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="1"
                           name="quantity">
                    <input type="submit"
                           name="submit"
                           value="update button">
                </form>
            </td>
        </tr>
    </table>
</div>-->
