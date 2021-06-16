using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OnlineStoreProject.DTOs;
using OnlineStoreProject.Response;
using OnlineStoreProject_Intf;
using OnlineStoreProject.Models;
using System;

namespace OnlineStoreProject.Controllers
{
        [Authorize]
        [ApiController]
        [Route("[controller]")]
        public class OrderController : ControllerBase
        {
        private readonly IOrderService _orderService;
        private readonly IMailService _mailService;
        public OrderController(IOrderService orderService, IMailService mailService){

            _orderService = orderService; 
            _mailService = mailService;
        }
        
        [HttpGet("GetAll")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllOrders() {
            ServiceResponse<List<OrderDTO>> response = await _orderService.GetAllOrders();
            if (!response.Success)
            {
                return BadRequest(response);
            }
            return Ok(response);
        }
        [HttpPost("Add")]
         public async Task<IActionResult> AddOrder(OrderDTO request){
            ServiceResponse<string> response = await _orderService.AddOrder(request);
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        } 

        [HttpGet("GetById")]
        public async Task<IActionResult> GetOrdersByUserId(){
            ServiceResponse<List<OrderDTO>> response = await _orderService.GetOrdersByUserId();
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> DeleteOrder(int Id){
            ServiceResponse<string> response = await _orderService.DeleteOrderById(Id);
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }

        [HttpPut("ChangeStatus")]
        public async Task<IActionResult> ChangeStatus(OrderDTO request){
            ServiceResponse<string> response = await _orderService.ChangeOrderStatus(request);
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }

        [HttpPut("Refund")]
        public async Task<IActionResult> Refund(int orderId){
            ServiceResponse<string> response = await _orderService.Refund(orderId);
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }

        [HttpGet("GetPendingRefunds")]
        public async Task<IActionResult> GetPendingRefunds(){
            ServiceResponse<List<OrderDTO>> response = await _orderService.GetPendingRefunds();
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }

        [HttpGet("GetSaleStatistic/{start}/{end}")]
        public async Task<IActionResult> SalesAnalytics(string start, string end){
            ServiceResponse<List<decimal>> response = await _orderService.SalesAnalytics(start,end);
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }
        [HttpGet("PDF")]
        [AllowAnonymous]
        public async Task<IActionResult> OrderPDF(){
            ServiceResponse<string> response = await _mailService.CreatePdf();
            if (!response.Success){
                return BadRequest(response);
            }
            return Ok(response);
        }
    }
}