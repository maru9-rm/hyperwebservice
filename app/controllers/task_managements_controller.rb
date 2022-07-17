class TaskManagementsController < ApplicationController

    def index
        @tasks = Task.all
        @not_yet_tasks = Task.where(status: 0)
        @complete_tasks = Task.where(status: 1)
        @over_tasks = Task.where(status: 2)
    end

    def show
        @task = Task.find(params[:id])
    end


    def new
        @task = Task.new
    end


    def create
        @task = Task.new(task_params)
        
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



    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to tasks_path, notice: '削除に成功しました。'
    end

    private

    def task_params
      params.require(:task).permit(:title, :content, :subject, :status, :user_id, :command )
    end

end