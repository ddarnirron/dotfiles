return {
  "echasnovski/mini.starter",
  version = false,
  config = function()
    local starter = require("mini.starter")
    starter.setup({
      items = {
        starter.sections.sessions(5, true),
        starter.sections.telescope(),
      },
      header = [[
                                         _.oo.
                 _.u[[/;:,.         .odMMMMMM'
              .o888UU[[[/;:-.  .o@P^    MMM^
             oN88888UU[[[/;::-.        dP^
            dNMMNN888UU[[[/;:--.   .o@P^
           ,MMMMMMN888UU[[/;::-. o@^
           NNMMMNN888UU[[[/~.o@P^
           888888888UU[[[/o@^-..
          oI8888UU[[[/o@P^:--...
       .@^  YUU[[[/o@^;::---...
     oMP     ^/o@P^;:::---...
  .dMMM    .o@^ ^;::---.....
 dMMMMMMM@^`       `^^^^
YMMMUP^
 ^^
 ]],
      footer = os.date(),
      silent = true,
    })
  end,
}
