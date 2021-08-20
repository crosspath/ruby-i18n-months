# frozen_string_literal: true

# Sorry, we cannot use `Module#prepend` in `I18n::Backend::Base` because
# prepended module isn't added to the inheritance chain of `I18n::Backend::Simple`.
I18n::Backend::Base.module_eval do                                  
  def translate_localization_format_with_months(locale, object, format, options)
    res = format.to_s.gsub(/%[#^]?[Oo]/) do |match|
      case match
      when '%o', '%#o', '%^o'
        begin
          val = I18n.t!(:"date.single_abbr_month_names", locale: locale, format: format)[object.mon] 
          case match
          when '%o'  then val
          when '%#o' then val.swapcase
          when '%^o' then val.upcase
          end
        rescue I18n::MissingTranslationData => e
          '%b'
        end
      when '%O', '%#O', '%^O'
        begin
          val = I18n.t!(:"date.single_month_names", locale: locale, format: format)[object.mon]
          case match
          when '%O'  then val
          when '%#O' then val.swapcase
          when '%^O' then val.upcase
          end
        rescue I18n::MissingTranslationData => e
          '%B'
        end
      end
    end

    translate_localization_format_without_months(locale, object, res, options)
  end

  alias_method :translate_localization_format_without_months, :translate_localization_format
  alias_method :translate_localization_format, :translate_localization_format_with_months
end
