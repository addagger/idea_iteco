LocaleSupport.multi({
  :ru => {
    [:address, :addresses, :resource_address, :resource_addresses] => {
      :index => { :title => "Адреса" },
      :new => { :title => "Новый адрес" },
      :create => { :title => "Создать адрес" },
      :show => { :title => "Адрес" },
      :edit => { :title => "Редактировать адрес" },
      :update => { :title => "Сохранить изменения" },
      :destroy => { :confirm => "Вы уверены?" },
      :flash => {
        :created => "Запись создана",
        :updated => "Запись обновлена",
        :destroyed => "Запись удалена"
      },
      :search => {
        :title => "Найти адрес",
        :prompt => "Запрос",
        :description => "Введите критерии поиска:<br/>страна, регион, город, улица (дом), индекс",
        :go_button => "Найти",
        :found => "Найдено %{count}",
        :nothing_found => "Ничего не найдено",
        :street => "Улица (дом)",
        :zip_code => "Индекс"
      },
      :meta => {
        :counters => "Статистика по адресу"
      }
    },
    :activerecord => {
      :models => {
        [:address, :addresses, :resource_address, :resource_addresses] => "Адрес доставки"
      },
      :attributes => {
        [:address, :addresses, :resource_address, :resource_addresses] => {
          :country_code => "Страна",
          :subdivision => "Регион",
          :city => "Город",
          :zip_code => "Индекс",
          :street => "Улица, дом, квартира",
          :description => "Описание",
          :deliveries_count => "Доставок по этому адресу",
          :resources_count => "Записей с этим адресом",
          :store_addresses_count => "Используется магазинами",
          :delivery_points_count => "Пунктов выдачи по этому адресу",
          :deals_count => "Сделок по этому адресу",
          :sold_out_count => "Продано единиц товара"
        }        
      }
    },
    :helpers => {
      :submit => {
        [:address, :addresses, :resource_address, :resource_addresses] => {
          :create => "Создать адрес",
          :update => "Сохранить адрес"
        }
      },
      :label => {
        [:address, :addresses, :resource_address, :resource_addresses] => {
        }
      }
    }
  }
})