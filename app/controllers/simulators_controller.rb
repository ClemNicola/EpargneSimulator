class SimulatorsController < ApplicationController
  include Wicked::Wizard

  steps :marital, :professional, :children, :income, :thank

  def show
    @user = current_user
    @simulator = @user.simulator || @user.build_simulator
    render_wizard
  end

  def create
    @user = current_user
    @simulator = @user.simulator || @user.build_simulator
    redirect_to wizard_path(steps.first, simulator_id: @simulator.id)
  end

  def update
    @user = current_user
    @simulator = @user.simulator || @user.build_simulator
    @simulator.update(simulator_params)
    # render_wizard @Simulator

    if step == :income
      redirect_to thank_you_path
    else
      redirect_to next_wizard_path
    end

  end

  private

  def simulator_params
    params.require(:simulator).permit( :marital, :professional, :children, :income )
  end

  def thank_you_path
    wizard_path(:thank)
  end
end
