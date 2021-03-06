class TasksController < ApplicationController
    before_action :authenticate_user!
    def index
        @tasks = current_user.tasks.order(status: "ASC").order(created_at: "DESC")
    end

    def show
        @task = Task.find(params[:id])
    end


    def new
        @task = current_user.tasks.build
    end


    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
          redirect_to tasks_path, notice: '新しい課題を作成しました。'
        # notice: でフラッシュメッセージにテキスト(ハッシュ)を持たせてリクエストを送ることができる。
        else
          flash.now[:error] = '課題の作成に失敗しました。エラーメッセージを確認してください。'
          render :new
          # この場合はレンダーなので、URLにリクエストを送るわけではないため、その場ですぐフラッシュを表示させるためにflash.nowで！
        end
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end


    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
          redirect_to tasks_path, notice: '更新できました。'
        else
          flash.now[:error] = '更新できませんでした。'
          render :edit
        end
  
    end

    def complete
      
    end



    def destroy
        task = current_user.tasks.find(params[:id])
        # @はつける必要ない。なぜならビューで使うわけじゃないから。
        task.destroy!
        # データを渡すわけじゃないので失敗するわけない、失敗したときはアプリがおかしいので例外が発生するように！をつける
        redirect_to tasks_path, notice: '削除に成功しました。'
    end

    private

    def task_params
      params.require(:task).permit(:title, :content, :subject, :status ).merge(user_id: current_user.id)
    end

end