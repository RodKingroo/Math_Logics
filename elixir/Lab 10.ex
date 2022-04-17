defmodule Recurs do
    def f(n) do
        cond do
            n==0 -> 1
            n>0 -> f(n-1)*n
        end
    end
    
    def pover(x, n) do
        cond do
            n==0 -> 1
            n>0 -> pover(x,n-1)*x
        end
    end
    
    def summ(x, n) do
        cond do
            n==1 -> 1
            n>1 -> summ(x, n-1) + pover(x,n-1)/f(n-1)
        end
    end
end

IO.puts(Recurs.f(6))
IO.puts(Recurs.pover(2, 6))
IO.puts(Recurs.summ(0.5, 5))
IO.puts(:math.exp(:math.sin(0.5)))
