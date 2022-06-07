local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local indent = ls.indent_snippet_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt



ls.add_snippets(nil,{
  processing = {
    snip(
    {
      trig = "setup",
      namr = "Setup",
      dscr = "Initial Setup Lines",
    },
      fmt([[
        void setup(){{
          size({},{});
        }}
        void draw(){{

        }}
      ]],
      {
        insert(1,"sizeWidth"),
        insert(2,"sizeHeight"),
      },
      {
        delimiters = "{}"
      })
    )
  }
})


ls.add_snippets(nil,{
  processing = {
    snip(
    {
      trig = "rect",
      namr = "rect function",
      dscr = "Snippet for writing rect funciton",
    },
      fmt([[
        void rect(float {}, float {}, float {}, float {});
      ]],
      {
        insert(1,"px"),
        insert(2,"py"),
        insert(3,"Width"),
        insert(4,"Height"),
      },
      {
        delimiters = "{}"
      })
    ),
    snip(
    {
      trig = "circle",
      namr = "Circle function",
      dscr = "Snippet for writing circle funciton",
    },
      fmt([[
        void circle(float {}, float {}, float {});
      ]],
      {
        insert(1,"cx"),
        insert(2,"cy"),
        insert(3,"Diameter"),
      },
      {
        delimiters = "{}"
      })
    ),
    snip(
      {
        trig = "quad",
        namr = "Quadr Function",
        dscr = "Snippet for writing quad drawing function"
      },
      fmt([[
        void quad(float {}, float {}, float {}, float {}, float {}, float {}, float {}, float {});
      ]],
      {
        insert(1,"x1"),
        insert(2,"y1"),
        insert(3,"x2"),
        insert(4,"y2"),
        insert(5,"x3"),
        insert(6,"y3"),
        insert(7,"x4"),
        insert(8,"y4"),
      },
      {
        delimiters = "{}"
      })
    ),
    snip(
      {
        trig = "ellipse",
        namr = "Ellipse Function",
        dscr = "Snippet for writing ellipse drawing function \n Uses center x and y and width and height of ellipse"
      },
      fmt([[
        void ellipse(float {}, float {}, float {}, float {});
      ]],
      {
        insert(1,"cx"),
        insert(2,"cy"),
        insert(3,"Width"),
        insert(3,"Height"),
      },
      {
        delimiters = "{}"
      })
    ),
  }
})




