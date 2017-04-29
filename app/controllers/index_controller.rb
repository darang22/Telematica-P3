class IndexController < ApplicationController
    def resultados
        @parametros = params[:q]
        @str = @parametros.gsub(/\s+/m, ' ').strip.split(" ")
        @str = @str.join('\' OR word = \'')
        sql = "select * from darang24 where word = '"+@str+"'"
        @resultados = ActiveRecord::Base.connection.exec_query(sql)
        @hash = @resultados.to_hash
        
    end
end
