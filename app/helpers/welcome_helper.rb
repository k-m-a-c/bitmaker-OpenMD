module WelcomeHelper

  def show_flash_on_welcome_page
    if !flash.nil? && !flash[:notice].nil?
        render partial: 'shared/flash_notice'
    elsif !flash.nil? && !flash[:alert].nil?
      render partial: 'shared/flash_alert'
    end
  end

end
