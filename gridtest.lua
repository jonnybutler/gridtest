-- Grid Test

g = grid.connect()

local cells = {}

function init()
  g:all(0)
end

function g.key(x,y,z)
  if z == 1 then
    exists = false
    for i=1,#cells do
      --check to see if this cell exists
      if cells[i].x == x and cells[i].y == y then
        exists = true
        exist_cell = i
        break
      end
    end
    if exists == false then
      add_cell(x, y)
    else
      remove_cell(exist_cell)
    end
  end
end

function add_cell(new_x, new_y)
  cells[#cells+1] = {
    x = new_x,
    y = new_y
    }
    grid_redraw()
end

function remove_cell(cell_num)
  local tmp = {}
  for i=1,#cells do
    if i ~= cell_num then
      tmp[#tmp+1] = cells[i]
    end
  end
  cells = tmp
  grid_redraw()
end

function grid_redraw()
  g:all(0)

  for i=1,#cells do
    g:led(cells[i].x, cells[i].y, 5)
  end

  g:refresh()
end


function redraw()
end
