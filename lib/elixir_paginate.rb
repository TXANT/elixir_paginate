# ｴﾘｻｰパジネーション
module ElixirPaginate
  #　パジネーションの論理【ろんり】
  def self.paginate(page, count, par_page)
    @end = count/par_page
    # 値【あたい】フロートの為に
    if (count%par_page) != 0
      @end += 1
    end
    ##
    if page != nil 
      @back = ((page.to_i*par_page)-par_page)
    else
      page = 1
      @back = ((page.to_i*par_page)-par_page)
    end
    @var = [@end,@back]
    return  @var
  end 
end