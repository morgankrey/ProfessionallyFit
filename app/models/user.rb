class User < ActiveRecord::Base
   before_save { self.email = email.downcase }
   before_create :create_remember_token
   has_many :posts, dependent: :destroy
   validates :first_name, presence: true, length: { maximum: 50, minimum: 2 }
   validates :last_name, presence: true, length: { maximum: 50, minimum: 2 }
   validates :age, presence: true, numericality: { greater_than_or_equal_to: 14, less_than_or_equal_to: 100 }
   validates :sex, presence: true
   validates :height, presence: true, numericality: { greater_than_or_equal_to: 24, less_than_or_equal_to: 100 }
   validates :goal, presence: true
   validates :job_type, presence: true
   validates :work_schedule, presence: true
   validates :current_weight, presence: true, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 1000 }
   validates :desired_weight, presence: true, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 1000 }
   validates :meals_per_day, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
   validates :snacks_per_day, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
   validates :body_fat_pct, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
   validates :plan_type, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
   validates :email, presence: true,
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
   has_secure_password
   validates :password, length: { minimum: 6 }
   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
   has_attached_file :mealplan, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

   def User.new_remember_token
      SecureRandom.urlsafe_base64
   end

   def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
   end

   def feed
      Post.all
   end

   private
      def create_remember_token
         self.remember_token = User.encrypt(User.new_remember_token)
      end
end
