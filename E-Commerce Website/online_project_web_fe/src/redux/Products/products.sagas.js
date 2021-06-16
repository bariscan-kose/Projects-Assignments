import {auth} from "./../../firebase/utils"
import {takeLatest, put, all, call} from "redux-saga/effects"
import {
  setProducts,
  setProduct,
  fetchProductsStart,
  setComments,
  fetchCommentsStart,
  getUnapprovedComments,
} from "./products.actions"
import {
  handleAddProduct,
  handleFetchProducts,
  handleFetchProduct,
  handleDeleteProduct,
  handleUpdateProduct,
  handleDiscountProduct,
  addCommentsHelper,
  fetchCommentsHelper,
  getUnapprovedsHelper,
  rejectCommentsHelper,
  approveCommentsHelper,
} from "./products.helpers"
import productsTypes from "./products.types"

export function* addProduct({payload}) {
  try {
    const timestamp = new Date()

    yield handleAddProduct({
      ...payload,
      createdDate: timestamp,
    })
    yield put(fetchProductsStart())
  } catch (err) {
    console.log(err)
  }
}

export function* onAddProductStart() {
  yield takeLatest(productsTypes.ADD_NEW_PRODUCT_START, addProduct)
}

export function* onDiscountProductStart() {
  yield takeLatest(productsTypes.DISCOUNT_PRODUCT_START, discountProduct)
}
export function* discountProduct({payload}) {
  try {
    console.log("asdasdas",payload)
    yield handleDiscountProduct(payload)

    //yield put(setProducts(products))
  } catch (err) {
    console.log(err)
  }
}

export function* fetchProducts({payload}) {
  try {
    console.log("data coming from saga2: ", payload)

    const products = yield handleFetchProducts(payload)
    console.log("data coming from saga1: ", products)
    //products = products.data
    //console.log('data coming from saga2: ',products.data)
    yield put(setProducts(products.data))
    //console.log('data coming2')
  } catch (err) {
    console.log(err)
  }
}

export function* onFetchProductsStart() {
  yield takeLatest(productsTypes.FETCH_PRODUCTS_START, fetchProducts)
}

export function* deleteProduct({payload}) {
  try {
    yield handleDeleteProduct(payload)
    yield put(fetchProductsStart())
  } catch (err) {
    console.log(err)
  }
}

export function* onDeleteProductStart() {
  yield takeLatest(productsTypes.DELETE_PRODUCT_START, deleteProduct)
}

export function* fetchProduct({payload}) {
  try {
    const product = yield handleFetchProduct(payload)
    console.log(product.data[0])
    yield put(setProduct(product.data[0]))
  } catch (err) {
    console.log(err)
  }
}

export function* onFetchProductStart() {
  yield takeLatest(productsTypes.FETCH_PRODUCT_START, fetchProduct)
}

export function* updateProduct({payload}) {
  try {
    console.log(payload)
    const product = yield handleUpdateProduct(payload)
    console.log(product)
    const products = yield put(fetchProductsStart())
    //yield put(setProducts(products))
  } catch (err) {
    console.log(err)
  }
}

export function* onUpdateProductStart() {
  yield takeLatest(productsTypes.UPDATE_PRODUCT_START, updateProduct)
}

export function* handleFetchComments({payload}) {
  try {
    console.log(payload)
    const commentsData = yield fetchCommentsHelper(payload)
    console.log(commentsData)
    yield put(setComments(commentsData))
  } catch (err) {
    //console.log(err);
  }
}

export function* onFetchCommentsStart() {
  yield takeLatest(productsTypes.FETCH_COMMENTS_START, handleFetchComments)
}

export function* handleAddComments({payload}) {
  try {
    console.log(payload)
    const comment = yield addCommentsHelper(payload)
    console.log(comment)
    yield put(fetchCommentsStart(payload.ProductId))
  } catch (err) {
    console.log(err)
  }
}

export function* onAddCommentsStart() {
  yield takeLatest(productsTypes.ADD_NEW_COMMENT_START, handleAddComments)
}

export function* handleApproveComment({payload}) {
  try {
    console.log(payload)
    const product = yield approveCommentsHelper(payload)
    console.log(product)
    yield put(getUnapprovedComments())
  } catch (err) {
    console.log(err)
  }
}

export function* onApproveCommentStart() {
  yield takeLatest(productsTypes.APPROVE_COMMENT_START, handleApproveComment)
}
export function* handleRejectComment({payload}) {
  try {
    console.log(payload)
    const product = yield rejectCommentsHelper(payload)
    console.log(product)
    yield put(getUnapprovedComments())
  } catch (err) {
    console.log(err)
  }
}

export function* onRejectCommentStart() {
  yield takeLatest(productsTypes.REJECT_COMMENT_START, handleRejectComment)
}
export function* handleGetUnapprovedComments() {
  try {
    console.log("getting unapproved comments")
    const unapproveds = yield getUnapprovedsHelper()
    console.log(unapproveds)
    yield put(setComments(unapproveds))
  } catch (err) {
    console.log(err)
  }
}

export function* onGetUnapprovedComments() {
  yield takeLatest(
    productsTypes.GET_UNAPPROVED_COMMENTS,
    handleGetUnapprovedComments
  )
}

export default function* productsSagas() {
  yield all([
    call(onAddProductStart),
    call(onFetchProductsStart),
    call(onDeleteProductStart),
    call(onFetchProductStart),
    call(onUpdateProductStart),
    call(onAddCommentsStart),
    call(onFetchCommentsStart),
    call(onDiscountProductStart),
    call(onGetUnapprovedComments),
    call(onRejectCommentStart),
    call(onApproveCommentStart),
  ])
}
