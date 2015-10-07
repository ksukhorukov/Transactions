
class TransactionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def delete_null_values(record)
    record.attributes.delete_if { |k, v| v.nil?}
  end

  def record_not_found
    render json: '{ "Error": "There is no such transaction"}'
  end

  def show
    @transaction = Transaction.find(params[:id])      
    render json: delete_null_values(@transaction).except("id").to_json

  end

  def create
    result = Transaction.find_or_initialize_by(id: params[:id]).update_attributes(transaction_params)
    
    if result
      render json: '{ "status": "OK" }'
    else
      render json: '{ "error:" "something went wrong"}'
    end
  end

  def types
    records = Transaction.where(type: params[:type])
    ids = records.inject([]) { |ids, record| ids << record.id }
    render json: ids.to_json
  end

  def sum
    zero_sum = '{ "sum": 0.0 }'
    transaction = Transaction.find_by_id(params[:id])
    unless transaction.nil?
      parent_id = transaction.parent_id
      unless parent_id.nil?
        transactions = Transaction.where(parent_id: parent_id)
        sum = 0.0
        transactions.each do |transaction|
          sum += transaction.amount
        end
        sum += Transaction.find_by_id(parent_id).amount
        render json: "{ \"sum\": #{sum} }"
      else
        render json: "{ \"sum\": #{transaction.amount} }"
      end
    else
      render json: zero_sum
    end
  end

  private

    def transaction_params
      params.require(:transaction).permit(:id, :amount, :type, :parent_id)
    end

  
end
