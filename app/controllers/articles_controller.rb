class ArticlesController < ApplicationController
    load_and_authorize_resource

    def index
        @articles = Article.all
        @published_articles = Article.where(status: 1)
    end

    def show
        @article = Article.find(params[:id])
    end


    def new
        @article = current_user.articles.build
    end


    def create
        @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to articles_path, notice: '新しい記事を作成しました。'
        else
          flash.now[:error] = '記事の作成に失敗しました。エラーメッセージを確認してください。'
          render :new
        end
    end

    def edit
        @article = current_user.articles.find(params[:id])
    end


    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to articles_path, notice: '更新できました。'
        else
          flash.now[:error] = '更新できませんでした。'
          render :edit
        end
  
    end



    def destroy
        article = current_user.articles.find(params[:id])
        article.destroy!
        redirect_to articles_path, notice: '削除に成功しました。'
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :tag, :status ).merge(user_id: current_user.id)
    end

end