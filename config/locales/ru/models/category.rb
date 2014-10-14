LocaleSupport.multi({
  :ru => {
    :activerecord => {
      :models => {
        :category => "Категория"
      },
      :attributes => {
        :category => {
          :title => "Название",
          :description => "Описание",
          :permalink => "URL-ID",
          :tags => "Тэги",
          :published => "Активна?"
        }        
      },
      :errors => {
        :models => {
          :category => {
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
        :category => {
          :create => "Создать категорию",
          :update => "Сохранить категорию"
        }
      },
      :label => {
        :category => {
        }
      }
    }
  }
})