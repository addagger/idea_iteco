LocaleSupport.multi({
  :ru => {
    [:website, :websites, :resource_website, :resource_websites] => {
      :index => { :title => "Веб-сайты" },
      :new => { :title => "Новый сайт" },
      :create => { :title => "Создать сайт" },
      :show => { :title => "Веб-сайт" },
      :edit => { :title => "Редактировать сайт" },
      :update => { :title => "Сохранить изменения" },
      :destroy => { :confirm => "Вы уверены?" },
      :flash => {
        :created => "Запись создана",
        :updated => "Запись обновлена",
        :destroyed => "Запись удалена"
      },
      :search => {
        :title => "Найти сайт",
        :prompt => "Запрос",
        :description => "Введите адрес сайта",
        :go_button => "Go!",
        :found => "Найдено %{count}",
        :nothing_found => "Ничего не найдено"
      },
      :meta => {
        :counters => "Статистика по сайту"
      }
    },
    :activerecord => {
      :models => {
        [:website, :websites, :resource_website, :resource_websites] => "Веб-сайт"
      },
      :attributes => {
        [:website, :websites, :resource_website, :resource_websites] => {
          :address => "Адрес",
          :description => "Описание",
          :deliveries_count => "Доставок с этим адресом",
          :resources_count => "Записей с этим адресом",
          :store_websites_count => "Магазины использующие адрес"
        }    
      }
    },
    :helpers => {
      :submit => {
        [:website, :websites, :resource_website, :resource_websites] => {
          :create => "Создать",
          :update => "Сохранить"
        }
      },
      :label => {
        [:website, :websites, :resource_website, :resource_websites] => {
        }
      }
    }
  }
})