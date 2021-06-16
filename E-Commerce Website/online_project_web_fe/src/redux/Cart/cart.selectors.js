import {createSelector} from "reselect"

export const selectCartData = (state) => state.cartData

export const selectCartItems = createSelector(
  [selectCartData],
  (cartData) => cartData.cartItems
)

export const selectCartItemsCount = createSelector(
  [selectCartItems],
  (cartItems) =>
    cartItems.reduce((amount, cartItem) => amount + cartItem.quantity, 0)
)

export const selectCartTotal = createSelector([selectCartItems], (cartItems) =>
  cartItems.reduce(
    (amount, cartItem) => amount + cartItem.quantity * cartItem.discountedPrice,
    0
  )
)
