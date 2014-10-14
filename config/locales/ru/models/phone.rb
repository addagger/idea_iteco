LocaleSupport.multi({
  :ru => {
    [:phone, :phones, :resource_phone, :resource_phones] => {
      :index => { :title => "Телефоны" },
      :new => { :title => "Новый номер" },
      :create => { :title => "Создать номер" },
      :show => { :title => "Телефон" },
      :edit => { :title => "Редактировать телефон" },
      :update => { :title => "Сохранить телефон" },
      :destroy => { :confirm => "Вы уверены?" },
      :flash => {
        :created => "Телефон записан",
        :updated => "Телефон обновлен",
        :destroyed => "Телефон удален"
      },
      :search => {
        :title => "Найти номер телефона",
        :prompt => "Запрос",
        :description => "Введите номер телефона",
        :go_button => "Go!",
        :found => "Найдено %{count}",
        :nothing_found => "Ничего не найдено"
      },
      :meta => {
        :counters => "Статистика по телефону"
      }
    },
    :activerecord => {
      :models => {
        [:phone, :phones, :resource_phone, :resource_phones] => "Телефон"
      },
      :attributes => {
        [:phone, :phones, :resource_phone, :resource_phones] => {
          :country_code => "Код страны",
          :number => "Номер",
          :fax => "Факс",
          :description => "Описание",
          :deliveries_count => "Доставок с этим номером",
          :resources_count => "Записей с этим номером",
          :store_phones_count => "Магазины использующие номер"
        }
      },
      :errors => {
        :models => {
          [:phone, :phones, :resource_phone, :resource_phones] => {
            :attributes => {
              :number => {
                :improbable_phone => "неправильного формата"
              }
            }
          }
        }
      }
    },
    :helpers => {
      :submit => {
        [:phone, :phones, :resource_phone, :resource_phones] => {
          :create => "Создать",
          :update => "Сохранить"
        }
      },
      :label => {
        [:phone, :phones, :resource_phone, :resource_phones] => {
        }
      }
    }
  }
})