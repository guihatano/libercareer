# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @answers = AnswersManager.new.process
  end
end
