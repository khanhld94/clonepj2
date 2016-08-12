class Lesson < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: :create, 
    owner: ->controller, model{controller && controller.current_user}

  belongs_to :category
  belongs_to :user

  has_many :results, dependent: :destroy
  has_many :words, through: :results

  validates :user, presence: true
  validates :category, presence: true

  enum status: [:testing, :finished]

  accepts_nested_attributes_for :results
  
  before_create :random_words
  # after_update :send_mail_result
  
  def load_answer_correct
    Result.sum_correct_answer self.id
  end

  def total
    results.size
  end


  private
  def random_words
    self.words = category.words.random_not_learned_word(self.user_id)
      .order("RANDOM()").limit Settings.number_word
  end
  
  def send_mail_result
    if self.finished?
      UserMailer.delay.send_result self
    end
  end
end
