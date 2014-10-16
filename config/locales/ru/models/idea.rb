LocaleSupport.multi({
  :ru => {
    :activerecord => {
      :models => {
        :idea => "Идея"
      },
      :attributes => {
        :idea => {
          :category_ids => "Категории",
          :group_ids => "Группы",
          :project_ids => "Проекты",
          :title => "Заголовок",
          :details => "Описание",
          :permalink => "URL-ID",
          :person_name => "Ваше имя",
          :person_email => "Эл.почта",
          :person_phone_code => "Код страны",
          :person_phone_number => "Номер телефона",
          :tags => "Тэги",
          :published => "Активна?"
        }        
      },
      :errors => {
        :models => {
          :idea => {
            :attributes => {
              :description => {
                :blank => "должно быть указано"
              }
            }
          }
        }
      }
    },
    :helpers => {
      :submit => {
        :idea => {
          :create => "Отправить идею",
          :update => "Сохранить изменения"
        }
      },
      :label => {
        :idea => {
        }
      }
    }
  }
})