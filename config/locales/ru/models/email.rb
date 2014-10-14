LocaleSupport.multi({
  :ru => {
    [:email, :emails, :resource_email, :resource_emails] => {
      :index => { :title => "Электронная почта" },
      :new => { :title => "Новый e-mail" },
      :create => { :title => "Создать e-mail" },
      :show => { :title => "Электронный адрес" },
      :edit => { :title => "Редактировать e-mail" },
      :update => { :title => "Сохранить изменения" },
      :destroy => { :confirm => "Вы уверены?" },
      :flash => {
        :created => "Запись создана",
        :updated => "Запись обновлена",
        :destroyed => "Запись удалена"
      },
      :search => {
        :title => "Найти email",
        :prompt => "Запрос",
        :description => "Введите email-адрес",
        :go_button => "Go!",
        :found => "Найдено %{count}",
        :nothing_found => "Ничего не найдено"
      },
      :meta => {
        :counters => "Статистика по адресу"
      }
    },
    :activerecord => {
      :models => {
        [:email, :emails, :resource_email, :resource_emails] => "Электронная почта"
      },
      :attributes => {
        [:email, :emails, :resource_email, :resource_emails] => {
          :address => "Адрес",
          :description => "Описание",
          :deliveries_count => "Доставок с этим адресом",
          :resources_count => "Записей с этим адресом",
          :store_emails_count => "Магазины использующие email"
        }        
      }
    },
    :helpers => {
      :submit => {
        [:email, :emails, :resource_email, :resource_emails] => {
          :create => "Создать адрес",
          :update => "Сохранить адрес"
        }
      },
      :label => {
        [:email, :emails, :resource_email, :resource_emails] => {
        }
      }
    }
  }
})