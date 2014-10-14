LocaleSupport.multi({
  :ru => {
    [:location, :locations] => {
      :index => { :title => "Места" },
      :new => { :title => "Новое место" },
      :create => { :title => "Создать место" },
      :show => { :title => "%{title}" },
      :edit => { :title => "Изменить место" },
      :update => { :title => "Сохранить изменения" },
      :destroy => { :confirm => "Вы уверены?" },
      :flash => {
        :created => "Запись создана",
        :updated => "Запись обновлена",
        :destroyed => "Запись удалена"
      },
      :search => {
        :title => "Найти место",
        :prompt => "Запрос",
        :description => "Введите критерии поиска:<br/>страна, регион, город",
        :go_button => "Найти",
        :found => "Найдено %{count}",
        :nothing_found => "Ничего не найдено",
        :country_code => "Страна",
        :subdivision => "Регион",
        :city => "Город"
      },
      :meta => {
        :counters => "Статистика по записи"
      },
      :select => {
        :another_subdivision => "Другой регион",
        :another_city => "Другой город"
      }
    },
    :activerecord => {
      :models => {
        [:location, :locations] => "Место"
      },
      :attributes => {
        [:location, :locations] => {
          :location_id => "Место",
          :country_code => "Страна",
          :subdivision => "Регион",
          :city => "Город",
          :permalink => "URL-ID",
          :published => "Активно?",
          :store_locations_count => "Используется магазинами",
          :addresses_count => "Адресов с этим местом",
          :firms_count => "Организаций-резидентов",
          :products_count => "Товаров произведено",
          :delivery_destinations_count => "Как место назначения",
          :delivery_points_count => "Пунктов выдачи товаров",
          :deliveries_count => "Доставок",
          :deals_count => "Сделок с произведенными товарами",
          :sold_out_count => "Произведенных товаров продано",
          :where_sold_out_count => "В этом месте товаров продано",
          :where_deals_count => "В этом месте совершено сделок"
        }        
      }
    },
    :helpers => {
      :submit => {
        [:location, :locations] => {
          :create => "Создать",
          :update => "Сохранить"
        }
      },
      :label => {
        [:location, :locations] => {
        }
      }
    }
  }
})