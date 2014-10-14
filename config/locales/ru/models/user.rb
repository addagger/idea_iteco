LocaleSupport.multi({
  :ru => {
    :user => {
      :roles => {
        :visitor => "Посетитель",
        :moderator => "Модератор",
        :admin => "Админ"
      }
    },
    :activerecord => {
      :models => {
        :user => "Пользователь"
      },
      :attributes => {
        :user => {
          :email => "Логин (email)",
          :password => "Пароль",
          :password_confirmation => "Подтверждение",
          :remember_me => "Запомнить меня",
          :sign_in_count => "Логинов",
          :sold_out_count => "Продано единиц товара"
        }        
      }
    },
    :helpers => {
      :submit => {
        :user => {
          :create => "Создать учетную запись",
          :update => "Сохранить данные"
        }
      },
      :label => {
        :user => {
        }
      }
    }
  }
})