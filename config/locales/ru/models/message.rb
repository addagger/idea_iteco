LocaleSupport.multi({
  :ru => {
    :activerecord => {
      :models => {
        :message => "Сообщение"
      },
      :attributes => {
        :message => {
          :person_id => "Автор",
          :content => "Текст",
          :person_name => "Ваше имя",
          :person_email => "Почта",
        }        
      },
      :errors => {
        :models => {
          :message => {
            :attributes => {
              :person_email => {
                :blank => "должна быть указана"
              }
            }
          }
        }
      }
    },
    :helpers => {
      :submit => {
        :message => {
          :create => "Отправить идею",
          :update => "Сохранить изменения"
        }
      },
      :label => {
        :message => {
        }
      }
    }
  }
})