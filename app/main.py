from starlette.applications import Starlette
from starlette.requests import Request
from starlette.responses import JSONResponse
from starlette.routing import Route


async def root(request: Request):
    return JSONResponse({'HEAD': f'{request.headers}'})


app = Starlette(debug=True, routes=[
    Route('/', root),
])