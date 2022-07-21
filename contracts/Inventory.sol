// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Professions {

    function professions(uint256 id) external pure returns (string memory str ) {
        if (id == 1)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAJFBMVEUAAAA0LSNDUStGPC4AAABRogBhEKLL84LStIzbQWHjUQD78jY7PUiZAAAABHRSTlMAAAAAs5NmmgAAAq5JREFUeNrt3NFxqkAAhlGSDmzBFtICLaSFFJUW0gIt2IIt0EJGJrMbdxbcRRgRz3lwcmP03m/g4R/CtWkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHict5Xf/xgeSp3DwyreX+0ICxYsWLBgwYJ3ubTiyPqoedlp3bnllBYsWLBgwYIF72FptdUjK5lbnSMsWLBgwYIFCxYsWLBgwYIFCxYsOGPta1qHea/tLw+uaQkWLFiwYMGCX3Npld7pfs/SmjbzVi6ntGDBggULFix480vrnpuwljHzVi6ntGDBggULFix480ur/tMbluaalmDBggULFix4r0trVBseuvBVYvSJ3I904cERFixYsGDBggVbWlMzqmBk5V5haQkWLFiwYMGCLa3m796tw/Xwql9acVoN98afHGHBggULFixYsKX1X1v4ve723HKEBQsWLFiwYMGW1s1VlTwxvaUsLcGCBQsWLFjwCy+t4ZeED/ioh+GXib0jLFiwYMGCBQve39KavhNrMPoJDF/htclQ+s788OgnSdxzF5dTWrBgwYIFCxa80aUVR9b0Xe0zP+uqdGklm6tqbjmlBQsWLFiwYMHbW1qlI6u5Hlkz59Yx89Uyc8spLViwYMGCBQve3tJqC0dWsq+OYQpV/UXnmqUV51bnCAsWLFiwYMGCn2xpxRvfZy6tpnAFtZNvkJtWyX9jLLhV3iktWLBgwYIFC97U0oqXs+J98H3mj3H71F+Smp5quVWVG2gFF7ac0oIFCxYsWLDgzS+tRFxawzL6DE/8zPtnJW9wvh5UTWZ9WVqCBQsWLFiw4CcP7i8KvucICxYsWLBgwYIF117TinKfiRWvaS3NNS2ntGDBggULFgwAAAAAAAAAAAAAAAAA8Ox+AToPYQ7TCItoAAAAAElFTkSuQmCC";
        if (id == 2)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgCAMAAABKCk6nAAAARVBMVEUAAAAMFCAQGyskDQIwEgMyEwQ5PT47MCZCGgVNOCZPQTO5qUG8tSj78jYAAAAWFxowUYKSNwvIThHuw5rw4rb78jb/AACe4tczAAAADnRSTlMAAAAAAAAAAAAAAAAAAKroblcAAAPISURBVHja7d3NTiJBFIDRVkHROL7/O84OIlFxZHZ1N5VKdar6x+acVaWhYZyPYnEDzTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA3Jq7pZ74kFaPlWd8pdWHbtXu/RcIjMAIjMAIjMAILDBbMfMkKze/2lWe+51WZlp2MAILjMAIjMAIjMAIfINmnmS9pdWu4VHMtOxgBBYYgREYgREYgRH4Bs0yydqn1XNa7bo8spmWHSwwAiMwAiMwAiMwAt+MCSdZLd8kHM9Myw4WGIERGIERGIERGIE3rvska975VY6Zlh0sMAIjMAIjMAIjsMBsUqdJVsyqXjLHlhIzrXPm2J9fE+lkByOwwAiMwAiMwAiMwHSbZMWV3B9W+Wf+S6tjWsUk67DySH/tYAQWGIERGIERGIERmEknWfHQ18WP1U6yPtPqqXhsGH3r0PAoJlkILDACIzACIzACIzBDt0lW/CZh/E7hY+W518n+uEtavadVzLTKk6yc8nSr97FgkoXAAiMwAiMwAiMwAjNM8Jmsx9HnxiTrUrzfvuF+x8z9Wj6TZZKFt2gERmAEFhiBERiBmd2qJlm9TTfJGkbfOjTczyQLgQVGYARGYARGYARmmGmS9ZU5FveLSVbuavHxbcCYS+1Hn1E7yVonkywEFhiBERiBERiBEZhh0klWzK/2xSdefpKVE9Otj8UjnexgBBYYgREYgREYgRGYlU2yyi7Fxyufcaw8I/c5rZhknexgBEZgBEZgBBYYgRGYjQe+T+LYNRHBDkZgBBYYgREYgREYgakw83Wy4ul2Dc9W++ksn8myg71FIzACIzACIzACC8yGzPzbheVvHOZcMsd8u9AORmCBERiBERiBERiBb9DqJ1k5tdMtkyw72Fs0AiMwAiMwAiOwwGzIr5xk1TLJsoO9RSMwAiMwAiMwAgvMhszy24W1v2fYR8yvPjOrste0ek4rkywERmAERmAEFhiBEZhVWMEka/z123tf5/2puDLJQmAERmAERmCBERiBWYVOk6yYVR0qzyhf16rl1hb7zCv/nFbvdjACIzACIzACC4zACMxy7vq8Ol4bXjEPmWOXhV6p5X/L0Q5GYARGYARGYIERGIFZTtMk621zr5OfzLHvtDrbwQiMwAiMwAgsMAIjMMvZ4CTrp+HcuBLW1Q5GYARGYARGYIERGIEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGAb/gN24p/66ZSJZAAAAABJRU5ErkJggg==";
        if (id == 3)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgCAMAAABKCk6nAAAASFBMVEUAAAAHBwgODxETKS0WFxoXMzkfREwoREw7Ly0/JgBQUVNVMwBVVVViRCRmPQAAAAAWFxpfzeRortSLi4unp6fsvLT/mQD///8R0jzJAAAAD3RSTlMAAAAAAAAAAAAAAAAAAAAnp8O0AAADpUlEQVR42u3dzW7aQBSA0aQJkLSV8v5v2V9FGArdzd1cjUxsD2PnnNUIMCH+bBZXBh4eAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOCjHtf4or+V1XNZDWX1nmzxWlb7sromO6H+LGv0xTG+bQILjMAIjMAIjMAI/JmsaJKVza8OZXUc+SzZFmOf5VxWf53BCIzACIzAAiMwAiMwrXU/yarPr9qKOdd6ZlrOYG/RCIzACIzACIzAArMZ3U+y3soqm18dJ9w7RTzzT2cwAiMwAiOwwAiMwAhMGyufZIW2My2TLARGYARGYIERGIERmOZWOcm63n0nmGQhMAIjMAILjMAIjMA01/0kK/vVwf3dd4dJFgIjMAIjsMAIjMAITHMr+u3CuDrLJMsZjMACIzACIzACIzACf0Irn2QNyePqc676FiZZeItGYARGYARGYIERmG5t+pqs4eYtst1xTG67lNVvZzACIzACI7DACIzACEwbG5xk3T6/ynbHMbltl/wN12QhMAIjMAILjMAIjMA00v0k66Ws4rcLswnVlPlV5lRWz2V1Lqv49cRfyW3OYARGYARGYIERGIERmAV0P8mqX4k1TLg3k82vMjHTiknWxRmMwAiMwAgsMAIjMAKzpJVPssLt3/0e6vOrc3XbPyMf5wxGYARGYIERGIERGIGZaDOTrNuNnV/tqtuaZCEwAiMwAguMwAiMwDTS6STrqay+l1Xba7JMsvAWjcAIjMAILDACIzCd6WCSFZOir9UjML6Har/YazlVX1/2uCFZnZ3BCIzACCywXSAwAiMwAjO/xpOsmEG9Tjja4lmW+5b1bKZ1SG47llWfV2c5g71FIzACIzACIzACC8xmNJ5kvc1yZGXXZF1mPsrjCqtrWdUnWe/Jbc5gBEZgBBYYgREYgRGY2XQwyYq51L9ki1P1WKx/zjC23Y18fdm3bV1H7qx43A9nMAIjMAILbBcIjMAIjMDMr4NPF76U1bl63A3Jvfvq4+Kfu47cYgqTLARGYARGYIERGIERmEXd7Rvf4zcJn5J76/Om+tVZYydZw8z/kUkWAiMwAiOwwAiMwAjMoh57ejFxddZhlmMxm2QtxyQLgREYgRFYYARGYAQGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4MP+A7pvbbbmrnc2AAAAAElFTkSuQmCC";
        if (id == 4)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAHlBMVEUAAAD/AAD/Pz8AAABJommiuv/as4DjUQD/AAD///9fauJQAAAAA3RSTlMAAAD6dsTeAAADF0lEQVR42u3dUXHbMADHYW0MQmEUSmEURiEUMggLhVAwhVEohVEQhV3yYJ09yZabaD3L3/fQS5uku9/ZD/+zuzYEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD7Dl1d/w9P9w+XZ73K9f4gtgr8e7QgLFixYsGDBgg+ztIbSEz8sLae0YMGCBQsWbGl9ZGkN62+ztJzSggULFixYsOCXOd85woIFCxYsWLBgwbvfV46wYMGCBQsWLPgTfODu4Wn9JenuYbpx+FZ68fv4KN1CvK7/G9ERFixYsGDBggX3t7R+Vb5uNrIeg+o8Psp9Optby346woIFCxYsWLDgQy6tYbqv3sYPt9Kn79NHFXPL0hIsWLBgwYIFd7i0Kn5j1mxpfRvflvO4Dfhny9J65n8mOqUFCxYsWLBgwTtfWrO5FdaXVqgcWZaWYMGCBQsWLLj/pRXW51Zuaf2evuT75qV1zQw0R1iwYMGCBQsW3M3SSrtp+9LK2b60oiMsWLBgwYIFC+5+aYXNc6vof1zOckoLFixYsGDBgvextNLcqv0bhxW/Tysszq3X/IUep7RgwYIFCxYseEdLK2Tm1jB9dpOYmVuvuZzllBYsWLBgwYIF72hppblVXFqPZZQuZ82uX82eOC0uregICxYsWLBgwYIPubTCdG7NrmnF0jti6Wu5v8tjaQkWLFiwYMGCD7e00lCqvYUYF59odznLKS1YsGDBggUL3u/SCtO5NSy+uDie2l3OckoLFixYsGDBgne5tNKCKt5CrJC7cRgdYcGCBQsWLFiwpfXPha1nllaTy1lOacGCBQsWLFjwfpdWmlsVtxBzGl/OckoLFixYsGDBgntYWmHz3Gr801lOacGCBQsWLFhwD0srza3L+OiWWVWz9XUep1W7y1lOacGCBQsWLFhwN0vrNC6o2Q9rxdLXbuMjS0uwYMGCBQsWbGmtzq3Llnc0vpzllBYsWLBgwYIF97W0QuXcavzTWU5pwYIFCxYsWHBfwfGu8TscYcGCBQsWLFgwAAAAAAAAAAAAh/UXSfd+aoV/XPcAAAAASUVORK5CYII=";
        if (id == 5)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAALVBMVEUAAABAeX1JomkAAAAoALowYIJBQf9BYftJomljm/9uRzSS0//jUQDuw5r///+KbJpuAAAAA3RSTlMAAAD6dsTeAAADU0lEQVR42u3dwXHaQACG0U06oAW34BZICaIEWgglOC24hFBCaIEW3AItZLQH7ayiFRJYxCveOzA2Ds58wx7+EZokBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+h28L//6X9mF//c+9tw8fDwj+/mzvsGDBggULFix4lUvrpftq6tIKD5hbjrRgwYIFCxYseDVLaz/nFY+4sOVICxYsWLBgwYIrX1qzLmf1llZYdm450oIFCxYsWLDgNSyt/W2vXfjCliMtWLBgwYIFC653aRUvZ51Kr9gOLK2w2NxypAULFixYsGDBlS+tCSPrZ/vwa3RuWVqCBQsWLFiwYEsrG1khX1qn0Vf05lbaXPG5zRJzy5EWLFiwYMGCBde7tKZ+Zjguzq1FLmw50oIFCxYsWLDg2pZW8e6sY/sQL129ll57bh/iRawm/8Eid2w50oIFCxYsWLDgKpdWcWQd8x+8tQ+H/LlmdG5ZWoIFCxYsWLDg51xaEy5nbfO5Fb/d5M9tRpdW+Ly55UgLFixYsGDBgmtbWkMj63f7cJ6ztOIHjLvS3LK0BAsWLFiwYMHPtLTG/yn4NLemGhpZaWmFT5lbjrRgwYIFCxYsuKKlNXQ5q8mX1qV92OSDKk2w9NNd/tpFLmw50oIFCxYsWLDgL7+0hi5npWm1G5hbYWBahXx9NaXfkpZWuHduOdKCBQsWLFiw4DqWVvHurF33XHFuFUdWKC2tNLcsLcGCBQsWLFjwWpfWrLuz4lrqXb+KN76f8+cuAy9b5I4tR1qwYMGCBQsW/OWX1n70jxxLP3jthtdlYG4lzeivv+fCliMtWLBgwYIFC658aRXX17YbWXFuna6vKkvLkRYsWLBgwYKfaWm93fY3Hbt9lT49vNy2tKKDd1iwYMGCBQsWLPgf55Z3WLBgwYIFCxa8enfdEV9UvFW+dz0sXpcav/G9yKeHggULFixYsOAVLq0JO2x8aR3yr4pL68M7LFiwYMGCBQsWPGOHtXpfeYcFCxYsWLBgwSv1kGta8XLWn+7bHwPfLvdfSjvSggULFixYsOBVL600t0K3qnrfBkvLkRYsWLBgwYItrZuX1iyWlmDBggULFiwYAAAAAAAAAAAArvgLBxN+bAe9NyQAAAAASUVORK5CYII=";
        if (id == 6)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgCAMAAABKCk6nAAAAPFBMVEUAAAAcAAkgMzAoPzwwABA2VVFIABhVVVVgACCQADDhuLjoycn///8AAACQADCi//OlKirbQWH/1wD////Oa/6vAAAADXRSTlMAAAAAAAAAAAAAAAAA7Uh4SAAABBlJREFUeNrt3U1T2lAUgGGs4kerq/7/Pym0CirpLmdz5szNEG4TfJ5VJkAA36SLM5d0swEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4bm7W+KHvxq2nDu/2Nm59rvBv9cM5ft0EFhiBERiBERiBEfg7WdEkK5tfxccfGvfV6qOscablCvZPNAIjMAIjMAIjsMBcjRVNsl7KD33OJGv683auYARGYARGYIERGIERmN5WOcmqP/70mVbro8EkC4ERGIERWGAERmAEpruVr8kaGs/UYfJXP5XvZpKFwAiMwAgsMAIjMALT3crXZPU4P4dkyyQLgREYgRFYYARGYASmu5WvycrWS7V+zdZXnJJHTbIQGIERGIEFRmAERmC6u5pJ1uVYk4XACIzACIzAAiMwArMIi59k3Y5bP8vz89S4bzP5FdmarL/j1pcrGIERGIERWGAERmAEpo/FT7JeknOx/r8GT5PP3voV2bvFK3auYARGYARGYIERGIERmD6ucJJVmz7nMslCYARGYARGYIERGIFZhFVOsmrz/Kaw9T1MshAYgREYgQVGYARGYDpZ/CRrO249ludn6zTqnDlXeB+3PlzBCIzACIzAAiMwAiMwfSx+knU/bsXM6Lnx/Jw+taqPsh+3Yr52dAUjMAIjMAILjMAIjMD0sdBJ1lOyL6ZHQ3l+Do37bhr3nZJHY6r25gpGYARGYAQWGIERGIHpY/GTrGz10zY5P4eL/WFikhXzq1gp9uoKRmAERmAEFhiBERiB6WOVa7Lm/nLTp2DWZCEwAiMwAguMwAiMwHS3+PtkxUzra9x6KD9+/QvB+tyuf5l4GLduxy2TLARGYARGYIERGIERmE5mmmQ9z/yx9uWjL13Pz5iC7VzBCIzACIzACCwwAiMw/89Mk6zfsxwl1jztG8/KX41n6jD5q8f86k+yzxWMwAiMwAgsMAIjMALT3exrsuKXf1/lK+L3eYfk0WySFUe+L79IbA2T/whD+dpj+ZldwQiMwAiMwAIjMAIjMBc1+yQr1i1ld7jK7i8V51jr/Cq2jsm+jzO+x7Y88jHZOriCERiBERiBBUZgBEZg+pj9ju8x04pVTY/j1nvyxq33xMpWYh2TfdnzWu/43nq8eN7OFYzACIzACCwwAiMwAtPHBf/vwuwXh613wgrTJ1mb5BX1JKv1KNn7mmQhMAIjMAILjMAIjMB0csE1WSGbZIVz1mTVd3KPedNd8rzP5Mitd4Y3yUJgBEZgBBYYgREYgenugpOsh/J5rauz/LrQFYzAAiMwAiMwAiMwAgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwFn+Af1eku+RGkg2AAAAAElFTkSuQmCC";
        if (id == 7)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAFVBMVEUAAAAgMzA2VVEAAACi//PsvLT/AABsaGxXAAAAA3RSTlMAAAD6dsTeAAACSUlEQVR42u3cXW6CQBiG0Wl3wBbcgvtfAluYLcwWGi+E1AzjB4jh55yLxqLSPIGLN8Y0JQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgPd+tjv1fdnb+m2Df692hQULFixYsGDB511a3Zx3FEtLsGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBggVHfeUb8WXOI9+IFyxYsGDBggULFixYsGDBggULFtzm/2m5pQULFixYsGDBx1pa48i6PX7k/88GjvWusGDBggULFizY0gotrShLS7BgwYIFCxZsacVG1ri08pxHadu55ZYWLFiwYMGCBR93aY1zq/ZxVm1f1V7iMy3BggULFixYsKU1MbJSZUblOcfSZnPLLS1YsGDBggULPs3SetlSOfiEpSVYsGDBggULtrRiSyvK0hIsWLBgwYIFW1qxpTU5t6LHLC3BggULFixYsKX11A2T6WVB1V5XKk/kyq/FFRYsWLBgwYIFX21p3YbJFJ1Rte9k1fZV+yxl6h2usGDBggULFiz4DEtrHFld83ULP40KnHTN3HJLCxYsWLBgwYJ3urSiI2vh3Jp10oVzyy0tWLBgwYIFC97f0mqPrDI8UVYsqNQ882fmlltasGDBggULFry/pXV/P7Lay2iN9tzqXWHBggULFixY8PmWVmke+/TmmvxrlpZgwYIFCxYs+HLB3YMrLFiwYMGCBQu+bjAAAAAAAAAAAAAAABzTH4SzUDc+QxNyAAAAAElFTkSuQmCC";
        if (id == 8)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAALVBMVEUAAAAbEQ0kFxEmDCYzETMAAAAzzMw5RzRuRzSZAGaZM5nMMwDuw5r/Zmb///8fkyrUAAAABXRSTlMAAAAAAMJrBrEAAAK9SURBVHja7d3dTQJBGIbR1Q62BVqgBVugBS1BS5AStAVaoAVasAVaMH4xM+5kZgAFzco5F4a/NXnCXrxZDA4DAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB/5+bCv3/x8WPZfcn248f+t4Jvr+0dFixYsGDBggX/y6WVR1Z/ae0qd9+8w4IFCxYsWLBgS+tnIyvE5axxurQuN7ec0oIFCxYsWLDg+S6tk0ZWbWldeG45pQULFixYsGDB811aq1NGVnNp5bm18Q4LFixYsGDBgi2tQ0vrrnvY1tJySgsWLFiwYMGW1neWVoysdbr7mG4Vj20tLae0YMGCBQsWbGkdv7Rqf2Z1n269Vp5dWFqCBQsWLFiwYEvrqKWV59ZzuvuUbhWPLaaHWVqCBQsWLFiwYEursbRiKOVPCvP1q7imFR8cjtPHhvTE0tISLFiwYMGCBVtaX8VuuqssrXii+Bb49XSH5ZcUS+vc3yDvlBYsWLBgwYIFz3JpFR8cxmWq/tdhFXMrxEeI+QLYuS9sOaUFCxYsWLBgwf9hae0qM6o/svITS0tLsGDBggULFmxpdZZWc24VnwWOrZFlaQkWLFiwYMGCLa3e0mrOrcK6e6ylJViwYMGCBQu2tIbOP+Jpzq314cMsLcGCBQsWLFjwtS+t5j+XjrX0kiZT8UdYMdAeWoed+99MO6UFCxYsWLBgwbNcWiF/1UMWW2qfbm2mT2zSYcWlq3N/wYNTWrBgwYIFCxY886UV16UWaUZl++m+GqbTapy+OJ6IK1k777BgwYIFCxYs2NL6vJI1VkZWsbRqxspjm3TY1jssWLBgwYIFC77ypbVqjaxvLq08t/xFvGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBAAAAAAAAAAAAAAAAAAC/6x3i7mC4aZckJwAAAABJRU5ErkJggg==";
        if (id == 9)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgCAMAAABKCk6nAAAAM1BMVEUAAAARESI0LSM8Hhc/KwBGPC5TQw1UOgAAAAAzM2aMjIyZAACqwtLM///StIz6yyf+rwDwmdKIAAAACHRSTlMAAAAAAAAAALfnUqEAAAN9SURBVHja7d3RTupAFEBRiwj8/9eCYvGtJyYnk9aWMjOu9TRR4Za7GR5O2vL2BgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1Gjo7yWdptVh8WPHafXZyf/GwXu8bwILjMAIjMAIjMAI/J90M8nK5lfn5GU+ij+7TateZlp2sI9oBEZgBEZgBEZggelG45Os8vwqe5nlSVboZaZlB/uIRmAERmAERmAEFphuNDnJmju/yl7m3ElWaHumZQf7iEZgBEZgBEZgBBaYbjQ5ybpMq/Ou/27MtK52MAIjMAIjsMAIjMAIjMAIjMAILDACIzACIzACk2nonKxjsnrVOVn3ZGUHIzACIzACC4zACIzAPFX1k6zs+wcvLz+quLow+95DOxiBERiBEVhgBEZgBOYJqp9kXZJVTa7Jyg5GYARGYAQWGIERGIF5guonWdk1hYfi32XiuwZPxZ9lsusHx+S3dzsYgREYgRFYYARGYATmmRq6T1ackxWTp5ge7THJOiaPvdrBCIzACIzAAiMwAiMwAiMwAguMwAiMwAiMwAhMaPycrLk+i79d83zOyUJgBEZgBBYYgREYgdlJQ5Osj2n1Pq2W3+GqbO41it/T6ssORmAERmAEFhiBERiB2cfQ9rvylKy2ufN6dk+sWI12MAIjMAIjsMAIjMAIzN6Gtg+/fBf4zHHx37VzJaEd7CMagREYgREYgRFYYLrW4SQrzP1mw/LfmWQhMAIjMAIjsMAIjMBUofFJVtwxK+6iddrkmWN+FXfC+raDERiBERiBEVhgBEZgXmeo82DOix8bM62YN635TsLs+ea6TauHHYzACIzAAiMwAiMwArOVoaZDOBd/lt3XKq4GvCXv2bgv+0fxCL6Kj11+BI/iz+xgBEZgBBYYgREYgRGYP6lgknVJDibedzGDKs+RYho1Js9Sfh+PxceuOYKYX13tYARGYAQWGIERGIERmHWqmmTFFX1rzog6rHj3jhsfQVyZaJKFwAiMwAIjMAIjMAKzUtfnZB0XH8t94yNwThYCIzACC4zACIzACMxmnJP1i3Oy8BGNwAiMwAiMwAIjMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAv8QPUzHLL3ZBXuAAAAABJRU5ErkJggg==";
        if (id == 10) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAJFBMVEUAAAA3NBM7Ly0/Pz9JRRlVVVUAAADMMwDd0UzsvLTwAGD///9OXsH8AAAABnRSTlMAAAAAAABupgeRAAACj0lEQVR42u3d3W3iQACF0Uk6cAu04BbSgltwUbRAC7TgFtKCW4hsCY9mMv4LgcjknAfEgr3SJ/NwZcRuCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/J23B//9H8PDaf24z+Hh+oTg9/92hQULFixYsGDBL7m04sjaurSeMbd8pAULFixYsGDBB19au0bWc+eWj7RgwYIFCxYs+OBLqy2MrGru4L4wt86usGDBggULFizY0lpbWtWe03pLS7BgwYIFCxZsae1cWl36bj33mqUlWLBgwYIFC7a09i6trSwtwYIFCxYsWLBgwYIFCxYsWLBgwRv8+j2t8U5W/O1hvKc1fl1Ypwdnr8V7WtfpmSssWLBgwYIFC7a0btppPPXp0gqLmyukZ4yHnF1hwYIFCxYsWLDgsmqQPbvnOFdYsGDBggULFnwwD/z2sHTXavZ2VnaIbw8FCxYsWLBgwZbWjHZxUHXr7/rtoWDBggULFizY0tq7tLLbVCdLy0dasGDBggULtrR+srRCYW4tL634r5laWoIFCxYsWLBgS2tpaZ2maVWvn9GlZ1haggULFixYsGBLa8b4A8ImHU+hsLniTax43GV46F1hwYIFCxYsWLClVVZPD3FBNdOMiv/vYXwtHtelE8wVFixYsGDBggVbWjfjeKrSGdVM75aWVkiPi/e0Lq6wYMGCBQsWLNjSKo+skM6oUFhf2RvZGQ+ZWz7SggULFixYsOBDLq22MJlCOq02/DE77ewKCxYsWLBgwYItrW9La3ZQlZ7NnmFpCRYsWLBgwYIFr2oGG15zhQULFixYsGDBggULFixYsGDBggUDAAAAAAAAAAAAAMAr+gL/5l1zOh4eRQAAAABJRU5ErkJggg==";
        if (id == 11) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAFVBMVEUAAAAAAABQUFBuRzTImHj/1wD///8SQzeNAAAAAXRSTlMAQObYZgAAAiNJREFUeNrt3MFxAiEAhlFjB7RgC7Zg2WlhW0gLtODoITuSBZGIOvDeLYk6fsMe/lHjbgcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwPt89Xvo8I/7xm7Paj/bCQsWLFiwYMGCB1paocezjE5YsGDBggULFjz50gp9n2p0woIFCxYsWLDgKZdWeNXzjU5YsGDBggULFmxp/XG8f5PF0nJJCxYsWLBgwZZWy8ha2n737LnlkhYsWLBgwYIFD7i0ai2Vt4tOWLBgwYIFCxY88tKq/XRW8lrVMTetal/TsrQECxYsWLBgwZZWZlolIys7vCwtl7RgwYIFCxZsaTWNrOzSqp1blpZgwYIFCxYsePbgcNH5Hk5YsGDBggULFvyZ3vGJ+OSVrK0fy/zvoWDBggULFizY0sosrWRQPf45LUtLsGDBggULFmxpZbZULD6ApeWSFixYsGDBgi2t9rmVXVq+I94lLViwYMGCBVtamaUV72+u8vc9lPdVsLQECxYsWLBgwVMurWRzVXjFt5Q6YcGCBQsWLFjwWEurPLeufzjc/u6nuKWiExYsWLBgwYIFW1rbq2p9329dX1tLa11VT3yn0AkLFixYsGDBgkddWsnmWpfW6XdfXTfX98bScsKCBQsWLFiwYMHtDhdOWLBgwYIFCxYsWLBgwYIFCxYsWDAAAAAAAAAAAAAAAAAAAAAAn+kMWB03+i7b7QMAAAAASUVORK5CYII=";
        if (id == 12) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAHlBMVEUAAABCMihLGRRVAACqAAD/AAAAAADImHj/AAD/6zsep3AaAAAABnRSTlMAAAAAAABupgeRAAACtUlEQVR42u3dwXGCQBiAUZIOaMEWbCEt2AJF0YItpAVbsAVayKwHHJdlZUXQ4HsHJqKSfLMc/kEmVhUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABsyddqv6m5/5J2hT/j+9NWWLBgwYIFCxa88UmrKXlxa4UFCxYsWLBgwSatjEPYdGGze+wA57Cpw+ZohQULFixYsGDBJq3BpLWfe5STSUuwYMGCBQsWLHigC97kKFZYsGDBggULFvwqy1zT2vebi7povup/OvUbKyxYsGDBggULNmndaG4nrejq1IR9rRUWLFiwYMGCBZu0BtPSoXiqGt13TOyzwoIFCxYsWLDgz5y0mn5kqvoZqfzTw+gArRUWLFiwYMGCBQu+O0b1Ug+tsGDBggULFix4U5a+pjV/Ngsb17QECxYsWLBgwYKLx6hVL2dZYcGCBQsWLFjwupa+Iz5/dWv0Lq7r+OWOeMGCBQsWLFiwSWso9TliV7LPf3kQLFiwYMGCBZu0CiataLTKX9MyaQkWLFiwYMGCBZeqg8stWpefrLBgwYIFCxYsWPAC45YVFixYsGDBggVv2Svu00oOXonX+fRQsGDBggULFmzSKpi0pjJpCRYsWLBgwYJNWjm7sPlJjFupbzuMnv0Nm7MVFixYsGDBggV/+KSV+krpaNw696/Lf3rY3b4jZfa/13JKCxYsWLBgwYL/x6R1HbLqxBORCVeodol9XeLhnHHLKS1YsGDBggULfvtJa3TIGp20uokHnfC2OeOWU1qwYMGCBQsW/PaTVv5299Enuue948Gb5p3SggULFixYsOCtTlrlTFpOacGCBQsWLNiklZu08l/Jkx+tTFpOacGCBQsWLNikdXe0ip6NvvywSjw0aTmlBQsWLFiwYAAAAAAAAAAAABj3B9lKeF5O7IsnAAAAAElFTkSuQmCC";
        if (id == 13) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAG1BMVEUAAAA8ABhQACAAAACi//PgsJDjUQDwAGDwsJAS8j20AAAAA3RSTlMAAAD6dsTeAAACrklEQVR42u3d3W2jQACFUZIOaMEtuAVaoEpaoAVacAu0EJkHJp7MjLEckDyc8xDtromlT/BwxfqnaQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJ772u+pL/cfbfGQ2/3HfGjw99nOsGDBggULFiy4tqXVrkurKx43Hr+5XNKCBQsWLFiw4I9cWtFNrO6V3x0f/zqv68sZFixYsGDBggWffWmFkdUVt9TW9TXuNrdc0oIFCxYsWLDgT1ta18SMCrepuo1za0wcPDnDggULFixYsGBLa9OCyi6tMTfV/vsFXC5pwYIFCxYsWHBdSyt6A+Kc+7fsSpucYcGCBQsWLFiwpfVsZJUN65/2+y9El7RgwYIFCxYsuJqltQylfp1R/eOqih6Yc09gaQkWLFiwYMGCLa3MUIqEfRXpLC2XtGDBggULFmxpFZZW9Or3PnHwUHwg9SyWlmDBggULFiz4xEsr9aHw7yyt8ATeeyhYsGDBggULPvvSWoQbW9M6j/qNIys82q5P5fO0BAsWLFiwYMGW1t+l1axD6e17WpaWYMGCBQsWLNjSagofFB9WVfTdOpfcyLK0BAsWLFiwYMGCdzDeOcOCBQsWLFiw4Arsc08r9QWG5VdnZb8z0T0twYIFCxYsWLCl1aTfgNgU59ZQPHhyhgULFixYsGDBltZv2RdrLTssvB9xePy3I16i5ZIWLFiwYMGCBde1tKI7WdEnkobjjnjboUtasGDBggULFlzr0gqf7RBGVvTlh5aWYMGCBQsWLNjSKllep9Wuu2nMHXJLPBB+Y84d4gwLFixYsGDBgk+8tKK59br9RpZLWrBgwYIFCxZcw9IKrq8cPDnDggULFixYsGDBggULFixYsGDBggEAAAAAAAAAAAAAoFY/yfNvikdR4eEAAAAASUVORK5CYII=";
        if (id == 14) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgCAMAAABKCk6nAAAAP1BMVEUAAAAAVVUAZmYAf38A//8SNS8bbWwggoIlFQooJCM2MC84BAZAFhcAAAAA//8OPw9xPx6ccVWikI6pDBPAQ0clGai8AAAADXRSTlMAAAAAAAAAAAAAAAAA7Uh4SAAAA5dJREFUeNrt3cFy2jAUQNG4Dk1K2///UCZpG3DoTm+j0dgTI1vyOSsPYAO5EYs3xjw9AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAezS0+KJ/pK3nlY88pa33TgJ/8z/eN4EFRmAERmAERmAEPpLdT7LOaWvM3Hta+dmuaeuWtv5YwQiMwAiMwAgsMAIjMHuw+0nW77R1qvq818xtLZ6xZQX7iEZgBEZgBEZgBBaYbhxkknVd+SjtzLSsYB/RCIzACIzACIzAAtONnU6yclfCKs+gcudQnYqPO8ZMywr2EY3ACIzACIzACCww3djpJKvGmVhrz7QuVjACIzACI7DACIzACMwjdTPJ+txoDZhkITACIzACC4zACIzAVNL4JOszs7X8/3juvrmjmGQhMAIjMAILjMAIjMBU0uQk65a5bSwebyreu3zfuHqXSRYCIzACI7DACIzACEwljZ+TFTOtMXNbzJtiGnXPvPW5+z5nXoFJFgIjMAIjsMAIjMAITCU7nWSd01bufKmYbi3/duGUOfLybxf67UIERmAERmCBERiBEZjqhnZeYMyvXtLWOPMo0+I9ykf5SFu3zL1WMAIjMAIjsMAIjMAIzAPsfpIV3+g7Z+6N7wrOvdbVWLytvG/ujxVnYt2sYARGYARGYIERGIERmEc6yCQrTF/YwyQLgREYgREYgQVGYARmQw1NskJc1+pn2irPpe5f+CPEJOutuC5MshAYgREYgQVGYARGYB5qaPvlx28c1phkXaxgBEZgBEZgBBYYgRGY7TQ+yXpNW3E9+HGVI8f8Kn6n8K8VjMAIjMAIjMACIzACs52hlzeyzkyrl/mVFewjGoERGIERGIERWGA6NPT3lmKS9bp435haXa1gBEZgBEZgBBYYgRGYfWl8kvWr+EbitrnXyco9Lq4v/2YFIzACIzACI7DACIzAbKfJSVZufvWStmIa9ZF53L14W/koLc60rGAf0QiMwAiMwAiMwALTjSYnWfGLhbnJU7ylf8U3nDv/6nvxcTHTuljBCIzACIzAAiMwAiMwtTU+yZo7eZpr7mTMJAuBERiBEVhgBEZgBKa6w52TVeacLHxEIzACIzACI7DACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAJv4DdOJuyUpLNzkAAAAASUVORK5CYII=";
        if (id == 15) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAHlBMVEUAAAAlFQo9NS8/Pz9VVVUAAABBksNxPx6iclD///+dqGclAAAABXRSTlMAAAAAAMJrBrEAAAKbSURBVHja7dzRbaswAIZR2g2yQlfICqyQKbNCVsgKrMAKFTyA7BhjkEIbc85D1TYpvZ/Iwy9Cb9MAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACs+zril1yGD232KY/hQ3/Av+X7bGdYsGDBggULFlzv0ppH1k/2ed1Rc8tLWrBgwYIFCxZcw9KKRtZlfUYdMbe8pAULFixYsGDBNSyt25aRFc2tuzMsWLBgwYIFCxZcpB84w4IFCxYsWLDgswUfck2rCx+Y79hKPeCalmDBggULFizY0tqwtDaxtAQLFixYsGDBltbWpTVfvyr4nqUlWLBgwYIFC7a0XkX/d1bqmla39EC0vt7yV4he0oIFCxYsWLDgz11a0d1ZO5fW++7Y8pIWLFiwYMGCBdewtJrNIyv1ZEtLsGDBggULFix4l27gDAsWLFiwYMGCK/Vn92kVPOo+LcGCBQsWLFiwpbUg9T5i6gJW6in+9lCwYMGCBQsWbGltWFqlN8hbWoIFCxYsWLBgwft1E2dYsGDBggULFlyzN17TGi9TXafPCq5pjZ89p8+cYcGCBQsWLFjw2ZfWdWlBjcZ74x/h+uqWvoyenFpkT2dYsGDBggULFlz90hpH0SX8spmGUpv4icf68VI/0SYO0K8fzxkWLFiwYMGCBX/u0rotzaPFufUMt1kT7qbr+gGiR+/OsGDBggULFiy4vqU1v13YZp83X3Rqp6XVhHOrDw8a/UT+yDvfTPSSFixYsGDBggX/56V1K5xCqWta+fmWP0Dqd9ydYcGCBQsWLFjwOZZW6r6qdvPSyh/F0hIsWLBgwYIFW1qv3ytYWvkDWFpe0oIFCxYsWDAAAAAAAAAAAAAAAAAAwAf7Ba5LcXmKhGH+AAAAAElFTkSuQmCC";
        if (id == 16) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAJFBMVEUAAAAWDAYcDwceCh4lFQozETM/Pz8AAAAOPw9xPx6ZM5n///96EUihAAAAB3RSTlMAAAAAAAAAVWTqWAAAAm9JREFUeNrt3dFt6jAAhlG3G7BCV2AFVmAFVsgMWaErsAIrsIJXYIXKUUXkEDsBQRBwzkMkCle9n5yHXxFSQwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJj2teyva/KX7fLB3592woIFCxYsWLDgT1haTemN1gkLFixYsGDBgi2tm23T5af0bkyXvRMWLFiwYMGCBVtat1inS/2Z1tEJCxYsWLBgwYItrSs113y4dcKCBQsWLFiwYEvr/iNrsbnllhYsWLBgwYIFv+HSqn9Py9ISLFiwYMGCBVta9x1ZT5hbbmnBggULFixY8BsGx2TGz5ywYMGCBQsWLPhdPPqZ1uBxVjz/LJbe7XimJViwYMGCBQu2tC5142lbWlp1/dLa5y+dsGDBggULFizY0gr/j7PGnlrFfH3FkTE2eOLVOmHBggULFixYsKV1sbQ26XLIZ1QYWV9h5N3+31paggULFixYsGBLK7NLl1VpUNWXVv+RU7r8OmHBggULFixYsKV1oZleWrH6Ed+IFyxYsGDBggVbWvOWVqy+tLTc0oIFCxYsWLCldfvS6p3ylytLyy0tWLBgwYIFW1pX6r7Vvi7NraJuZB3T5eCEBQsWLFiwYMGWVkX3wGp3fjnj7x52X4E/OWHBggULFixYsKU1ZfDHDzf5qurX1+D5lb8wLViwYMGCBQu2tObtq1CaW2MjKyywudzSggULFixYsOCXXFrNzM9tpkfW4+aWW1qwYMGCBQsW/GpLq3ns/7J1woIFCxYsWLBgwYIFCxYsWLBgwYIBAAAAAAAAAAAAAAAAAEb9Aa5XRndrHSfvAAAAAElFTkSuQmCC";
        if (id == 17) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAGFBMVEUAAAAGACMIACwKADsAAAAgALL/AAD////USpGGAAAABHRSTlMAAAAAs5NmmgAAAsVJREFUeNrt3d1to0AYhlGSDmghLaQFl+0WaCEt0EJkJDNm9M0YHHAEnHMRrf+0+wguXi1etmkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+A8f7/3tLsFz17f+CT7PdoQFCxYsWLBgwcddWt+3H+30ufSwn74wPOwcYcGCBQsWLFiwpTXLJVhafbC50gtXR1iwYMGCBQsWbGm9vLSKLC3BggULFixYsKVVU79cOGNpZQ87R1iwYMGCBQsWbGk9jqzsm1iLllb22bXnllNasGDBggULFrzLpbXoO1nNzPetfUXRKS1YsGDBggULPszSymZUXfGzlpZgwYIFCxYs+OxLK7p6OHduFT/h6qFgwYIFCxYs2NK6+xp/FBdUXVpkP+MPR1iwYMGCBQsWbGndpeuIL35Pa7v7PTilBQsWLFiwYMGHWVrRloq87R6mTmnBggULFixY8M6XVnZTreFX6YpiuiCYPddPl1bnCAsWLFiwYMGCLa0K94h3SgsWLFiwYMGCt9feLHrBERYsWLBgwYIF79uG39N62FLjj0H0Lfl++sLA97QECxYsWLBgwZZWYWmlf0TYBtOqCYZXP/2YpSVYsGDBggULtrRqS6upzq2+9BZLS7BgwYIFCxZsaS1YWtnIaqqvWlqCBQsWLFiwYEurIN0oPppbkex9m9we3iktWLBgwYIFCz7C0hp2U3ZTreLcit7SPd9mjrBgwYIFCxYs+ExLK7pfaaRf8hb/w7RgwYIFCxYs+OxLK42ste+M1a88t5zSggULFixYsOC9La3sK/DRBcHic9GvoqV1dYQFCxYsWLBgwZZWZUFlX70qvpo9tLQECxYsWLBgwZbWZCg1wXia8Zyl5ZQWLFiwYMGCLa2nS8vfaTmlBQsWLFiwYMHv1I4cYcGCBQsWLFgwAAAAAAAAAAAA/MkvamJua/Ny5EQAAAAASUVORK5CYII=";
        if (id == 18) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAHlBMVEUAAAAHBwcJCQkMDAwAAAAAzMwA//8kJCTStIz/AAC/eHBdAAAABHRSTlMAAAAAs5NmmgAAAmlJREFUeNrt3NtxgkAAhlGTDmzBFrYFWkiVaYEWaMEWbCEDDzBLBHaFHQXOeXA0XibfwMM/6ni5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwPl+FXz+0F9ecZzzai6bYP/R9tiMsWLBgwYIFCz7k0hpGVsh5WlN2bjmlBQsWLFiwYMFHWFpV9sgaza3aERYsWLBgwYIFCxYsWLBgwYIFCxb8ROn3tG79ze4DwWvizXt74T0twYIFCxYsWLCltbi0JlfV5B2WlmDBggULFizY0ppwiy8us6vq2c17fOEICxYsWLBgwYLPubSq/lod/230Aw/Dtd/+Id0zfuK5NVwr8rV4p7RgwYIFCxYs+IDBj17qHY6wYMGCBQsWLFjw4r4q/AxHWLBgwYIFCxb8mbb89LBT938La1/Zp4eCBQsWLFiw4LMvrdHc6pbR8GX4Nb9c6hvxggULFixYsGDB/91bH/IqjrBgwYIFCxYs+F02f0+rs+aNrXJvZzmlBQsWLFiwYMG7XFqjufXs9x6yllbtCAsWLFiwYMGCLa2lpXXtl1bC3Cr8dpZTWrBgwYIFCxa8t6VVzd5bxw8JsyNrtNIcYcGCBQsWLFiwpZUmxIMq697OY/khjrBgwYIFCxYs+FhLK/XzwWb2IU3iC6yeW05pwYIFCxYsWPA+llaIl1bqWgqvjaywydxySgsWLFiwYMGC97G0qk1204vbrHaEBQsWLFiwYMFnW1r5cyv/IZaWYMGCBQsWLFjw1IJqhZYjLFiwYMGCBQsGAAAAAAAAAAAAAAAAADiLP/llemltSznuAAAAAElFTkSuQmCC";
        if (id == 19) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAMFBMVEUAAAAIEAwLFA8OGxQeFQ4lFQo3MiU/NQBVRwAAAAAaDgwsUz5bQCxxPx6nmHD/1wCQiPBVAAAACXRSTlMAAAAAAAAAAABzZJuhAAADSElEQVR42u3d723aQADGYacbZAWv4BVYgRXCCOkI6Qh4BVbwCqzgFVih8qm60x1nsFXyB3ieD4g0xPQn58Mrg0jTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAXPfyFU/STjfva36in26On/F/+fVsZ1iwYMGCBQsW/GhLqzat2os/sZluhvjlON3snGHBggULFixYsKX1TzfdvC2cVsXISgZLS7BgwYIFCxZsaZ3ZV/bVuHBzuablV1qwYMGCBQu2tFYsrfUjK92ztAQLFixYsGDBllamePXwf/yebk7OsGDBggULFizY0jqzj/c2q382vYTompZgwYIFCxYs2NJatrSKlxVn/83SEixYsGDBggVbWue2+bQqXkfsK9/orz84DK+DMyxYsGDBggULfvKltY9La8g3V7D0mlaTHyDc2znDggULFixYsGBLa/kbs4aFD7a0BAsWLFiwYMGC83k0+dYDOMOCBQsWLFiw4O9382ta4Q1X6W1W6arV7EWsofK4Jj+Ua1qCBQsWLFiw4GdfWuEPHRYfVVp89nszt6pmHxzewPXHGRYsWLBgwYIFP/nSCvY3Pt7OGRYsWLBgwYIFW1rX5tblD4/vv2Bk+ZUWLFiwYMGCBd/50nqdbj5ucqhP+ZM8fqUFCxYsWLBgwT95aX3EQTUrvFlrrHyjdmGrX3OA5BTHmDMsWLBgwYIFC36EpRWGUvGHpPv4ZR83UhPH2HH1/6iNzxEc8sMXz9uvfg6/0oIFCxYsWLDgn7e00sjaxgFU20hpZCVLp1A3d7zZZxvjdwdnWLBgwYIFCxZ8t0trH0dWMZ5e5wbVNn9If33IDfHBs4dq4uPa/Hl3zrBgwYIFCxYs+L6XVhun0JiPnS4OoGSMG2mI92pvvWrjQ8JRDvmRi886PVR+1tISLFiwYMGCBT/C0ipeFdxU/m2ojKxkWzlyGllpoB3zXddUVlrxDUtLsGDBggULFnznS6uLw2ZTmT1pZF1+x1bxGfHb/MviVcG3ygGa/HEHS0uwYMGCBQsW/ChLq/iEq00cQF28V7skdXlpFde+TvkBurmRZWkJFixYsGDBggEAAAAAAAAAAAAAgBv7CzMigzV5+312AAAAAElFTkSuQmCC";
    }

}

contract Locations {

    function locations(uint256 id ) external pure returns (string memory str ) {

        if (id == 1)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAgMAAAAAulYGAAAACVBMVEUAAAD78jYAAAAbgqRaAAAAAnRSTlMAAHaTzTgAAAEJSURBVHja7dm7DoIwGIDR4sj72dlHc+7k07G4aEAEBFEZLE3OGbyE4Ysl+dNiCAAAAABQvmrlWn0OsXuZXwihOfWf7uLP4UOuXywsLFx+uFq/nLoBtXShFy21sLDwvibX+tAaezPhLLWwsHCeydVuvNLoeNh+fRlaS6dKSy0sLJxxzzWMpf7ZV3hOs7TtyOgeCwsL//O0OAyytG275R4LCwtnCDcxWmphYeFS9lzH7u16mR8jLbWwsHAp6pQstbCw8B73XGn6NP7jWfI0+TfSUgsLC+c9LT4G2drQstTCwsIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMBXbp8VMNLL7myeAAAAAElFTkSuQmCC";
        if (id == 2)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAMBJREFUeNrt2EGKhDAURdEPWYBLcusuyQUEXg/UKkvsBluhJufMYryOQkKsAgDg+1r2oyHLMJlbkiTrs21CLL4bZ6qWd5xJLL4Rb2/vhou5rZ8Ri2/FvdZV+Fe8boVi8YV4XM7PXpmGXu+4xvTax9WSpJdYfCXOiV/iqmQusfhSXOMx7SUWPxjX8LGnjXOJxY/G1faL8+yIfU2Ixf+J6/Reeoi3f2ti8RMxAAAAAAAAAAAAAAAAAAAAAAAAAMBTfgD9/8w69UxrSAAAAABJRU5ErkJggg==";
        if (id == 3)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAMZJREFUeNrt2U0KgzAURtEHXUCW5NazJBcgfB0k0tJShKadnTMQf3IdBRKxCgC4lN6Oqi2HWPyXuLa9Kkkyr1syDlvmW5NdLP42Tm/Hp3i+QSxeiKvq9jTwJU7E4rV4PH6ao2LxD+PbGFDbfp5Vy3kvR4nFa/Hcv6W3ORVf4qv1WSyu633YwjeGWHwdn/NxjhGLfxuPvdpYYo8PcZJ0sfiruFqSXmLxv+LHOrsv/HwSiwEAAAAAAAAAAAAAAAAAAAAAAADgzR3NUEbAfUghZQAAAABJRU5ErkJggg==";
        if (id == 4)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAANJJREFUeNrt2MFpxDAURdEPLsAluXWX5AIELwtJzpAJSWZQducsBDJcr8yXcBUA8IstOff0RSxeHu+t6riqLzmrqo4kybVlblslydiKxa/Ed/fwhtxx+rbdz8TiFfE1J+PQarxGLH41rr31JWeNASgWr4xry4y3fombs2/c7h6OWLH4jXhe3fqH+mN8llj8RlzHtaUfsTUH4FP8/QAUi/8QP3+eYvHaeG99GfHnrw6xeEH8ZQA+/kwTi1fEAAAAAAAAAAAAAAAAAAAAAAAAAAD/5QOzt8iY1V0URwAAAABJRU5ErkJggg==";
        if (id == 5)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAANlJREFUeNrt2U1uwjAURtEneQFZkreeJXkBkb4O8tO0pAUKk0rnDCJi53pkGQWqAIDfZJ6WryMt1YdY/K44WSrzcd9HSzKqqifJXO18SRax+Nk455merPE6kXWtlsxTxOLn4+3pdbBlX6tqW2EcY1NycwKKxXfj2h+8+iQWvyWunqRq2nbm6WT8PPvE4lfiY1NextXE4pfimrav2G+HolgsFv+XOBn34psXUbH4wbha9j36U3zxY5pY/HB8fgf9y59PYjEAAAAAAAAAAAAAAAAAAAAAAAAAXPsAIKBRED4ef4kAAAAASUVORK5CYII=";
        if (id == 6)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAM9JREFUeNrt2UsOgjAUQFESF9AlsXWWxAKaVEqLQFA+irNzBgSB2xF5EGwaAOBQypo2bzux+O74kcoKY9f29VhdJuQV+7x+PtGmKBZfjEOcDg4Xlp9zPN6yaTgrFv8pjotNWUEsvhRPA7DIA3DoxOL74nx1mOZc7TYDsDxs373iicV7cXqZR6FYfGPchbjYq5uTA1AsPo6Pbk+x+Kf48yO2fmBbddvvJGLxqXi1JxbfHE/vail985+TWAwAAAAAAAAAAAAAAAAAAAAAAAAAO55TUpB2ehNmsQAAAABJRU5ErkJggg==";
        if (id == 7)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAALVJREFUeNrt2MEJg0AURdEPFmBJtm5JU4DwspgYQ0wIDBKyOGcxKHpnJX60CgCAP5QkyVpTP6glW/VFLL4uTjvifQexeDSe8hy3qh6vVVVL30QsHoj75Zpzv1EsvjKekrTH5XaOs09XsXggnrfK2pck67x9js8jViz+Fi/tmK7H8u4FKBaPxI9n9GXiisUXxks7nZ4/RMXi4dg/QPHPYwAAAAAAAAAAAAAAAAAAAAAAAACAS9wAUzzCRqbacQIAAAAASUVORK5CYII=";
        if (id == 8)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAMVJREFUeNrt2MtthUAQRcErEQAhkTohEQDS9WLAwvLv+RnLm6rlwJlltyABAOC/LVuSzHuSTG23JEv3tG27zu14sIrFz8dLX+PRicW3xd3fxj1v2HKcHTeIxT+N5/0cdlvSVSy+O26ztM2yTR3xOs6OAZgkYx6KxU/E59vXTSoW3xgn7Tb1smIv8ff7WSx+ZEvu44Z3A1As/m08nuz5dAB++SEqFj/yt+KDjSsW/1EMAAAAAAAAAAAAAAAAAAAAAAAAAHCnFxbSDkQR7kJoAAAAAElFTkSuQmCC";
        if (id == 9)  return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAALdJREFUeNrt10EKwjAQhtGBHKBH8uo5Ug9Q+F00ihSrFou4eG/RTfLtygypAgA+dJnF4l/FLelTkmSpZK71IxaLxX8bJ1m28TgQi8+I+7Qbt4jF38UtScbtxwE4V60nvcTir+K6zG0/frmcxeIDcUv6ZgB+/nuKxc9Ny7piR3dsxYrF7+OMiddvy/bAM0Esfh8v60M0ve47VSw+Nx4D8DixGAAAAAAAAAAAAAAAAAAAAAAAAAD2XQGTLzLWI23xcAAAAABJRU5ErkJggg==";
        if (id == 10) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAKhJREFUeNrt2EEKgzAURdEPLsAluXWX5AKE14GmrZ2YIhYK5wyCSK7DT0wVANBrXMXin8RTkmSp2pckYvGleMzT2uKslSzD/noWiy/E1fZkqapp+0KL5xrE4ovxPvbak1h8b3wYgGLxLfF2iBOL74gNfbFY/Gdx5rZ8xqc/omJxT/za8x733cSJxefXtVPPla5YXAAAAAAAAAAAAAAAAAAAAAAAAADwlQefwokWvWw73gAAAABJRU5ErkJggg==";
        if (id == 11) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAL9JREFUeNrt2EEKgzAQQNGAB/BIXt0j5QBCakcjWpS2wUIX7y0q0nxXQ02TEgAAf6iEsY/LNN/mtHyIxY3xEOvyVVyfIBa3xWWMSz/VOBbO8e5ZYnFr3JXadUUsvj2uQ5mGvA5qrI24vl07sbgl3l6i4zaZ5/HZJk4sfhcPyw7tKJ/8AIrFTXEM4HMy16/L1SZOLG6Ld2cb0/Jv9CX+5KhDLP7+ME0s/mUMAAAAAAAAAAAAAAAAAAAAAAAAAHCLB2mCV6EvG0cfAAAAAElFTkSuQmCC";
        if (id == 12) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAKNJREFUeNrt18sJhDAUQNGABVhSWrekFCC8QWMYFAaRRJjFOYv4wesqPDQlAAD+UY5NaWdLmrZFLB4bx5rqMYpY3Bcfu/B7udZl36NicW/cnhGL34inOLbnvD4fgGLxXbwnc0R9zfkjTizujnM5jcLl0QAUi+/i681cxOJxcZt4l3koFg+Kf/6XisVvxgAAAAAAAAAAAAAAAAAAAAAAAAAAI3wAcO7T2yVQ820AAAAASUVORK5CYII=";
        if (id == 13) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAANlJREFUeNrt2EsOgyAUQFESF+CSuvUuyQWYUBAVq/0Eo7NzBqTVXJ28YGsIAMB/jzimtY9RLL4nHrpYliJdJhnnq+YlxmG9iVjcGoc+nX7265kSp2kVi6+JwzSeYROXRSy+Jj6OZ42nrVAsPh0vT9d52W2AWTomFp+OwzKZ04zuf8Ql+ZhYfDruygBuP202wHU8l61QLG6L8yjW8Yz1pcfbI7ZeRixuivPBw9fj34T5JkEsbo7H/bR+jkMXv7zmFYt/xAAAAAAAAAAAAAAAAAAAAAAAAAAAt3oBqbhFWXm1BKYAAAAASUVORK5CYII=";
        if (id == 14) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAANBJREFUeNrt2E0KgzAURtFAFuCS3HqW5AIKXweJ/QHRatvZOYMQKNeR5JmWAgB8JslNLP5TPCVlXmrS+mPysuu/9kUsvhTPy/p6jl2SLHVsmlj8g/j1MX2pSStVLP4+LtOYruPY24jniMXX41KzLtsH4O4nnlh8GJeS9nhHx0fce7wUsfhq3G8I6xDdOgB3Xk+x+ChOm25jup4fsWLxQVzTrwlzktPXBLH4g7vkc7qKxf+I+4h9/El7klgMAAAAAAAAAAAAAAAAAAAAAAAAADvuA0UOgDfzyt0AAAAASUVORK5CYII=";
        if (id == 15) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAKpJREFUeNrt2EEKgzAQQNGBHMAj5eoeKQcQpotUG7pJwQhdvLcQTPi7IUEjAAD4TyUz84iomZl7lMxdLF4Xb9nj7JpYfCt+72zHEPeNbBFi8b24ZNQWEbWVFIuXx9vRH7kPg3rFkwNQLJ7FtZ0zOryKxaviz+J4z/54AIrFk/i6U78GVSxeE88/RMXiJ+LzZ5pY/FAMAAAAAAAAAAAAAAAAAAAAAAAAAHDfC2Cr2BTCfzGcAAAAAElFTkSuQmCC";
        if (id == 16) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAKxJREFUeNrt2EEKgzAQQNFAD5AjeXWP1AMUphqr0U1aNEIX7y0kot9VGNSUAAD4B1GMZZ0jyiHiuV6YV2Lx6fgR+3vmeFjOX2Jxhzh/dma5e42n1bCdNojF3+J5K+4ONU51HorFV+JpzpXtOeYaH+ahWNw5Xl7ifhqAYvGJAbg9VSy+HHtxFd8ctz5ExeIOceNnmljcJQYAAAAAAAAAAAAAAAAAAAAAAAAAuMMbUbA0tjAlULkAAAAASUVORK5CYII=";
        if (id == 17) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAgMAAAAAulYGAAAACVBMVEUAAAD78jYAAAAbgqRaAAAAAnRSTlMAAHaTzTgAAAEJSURBVHja7dq5DoJAFEDRp4mN/8fU82nU84FT2xBFmOAWWZJzKty4cQryWCIAAADgE9dS/rfz81b/SlhY+Pjh09KRq4/0/PIhRUSU+9bwac0xPtjVbKmFhYV3FC6l/21os9TCwsKrzVw1N7dKYw4bT2SWWlhYeL3wW6OVpRYWFt7LzDWc6D2uVbVmrvn3JueHZi5hYeGDhWtKllpYWHiDmStmdw9d5xIWFj5E+NJ1llpYWHjvM9f82a3Je5NJq/08l5lLWFh4s3DrBmNK+fUPXecSFhbebOZafhjeUgsLCwMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN+4AeUNO4BFym3mAAAAAElFTkSuQmCC";
        if (id == 18) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAgMAAAAAulYGAAAACVBMVEUAAAD78jYAAAAbgqRaAAAAAnRSTlMAAHaTzTgAAAFGSURBVHja7drBTsJAFEDR4tL/Y9b9NNaPDV/XjRuwtZk6DKFEO43mnIVaCrmxJC8vha4DAACA0uHZE95P0+/0y+G3vf5jYWHhvx8+rBhaWTG+YvH30JevSNPh7cSx+7i41MLCwg3CEadVj81jLsKlFhYW3nvninLJmjeo2lPi+5L18BXeY2Fh4e3C4wY1pLTctMbDV1crl1pYWLjRzhWfi1JUtqXiRH3nGuXbXnYuYWHhdpMrD56veZWn1KuTyx16YWHhjSfXbdyk6UcxyO7Prr3PZXIJCws3D6fU/yxyPl9camFh4YY7V/FN1PudazHhqt/nyofeY2Fh4a3D+RPF0fKxmvmDSJdaWFh4h52rq9xvL9aooXephYWFdwwDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMD/cAUfhWUPy5ARVwAAAABJRU5ErkJggg==";
        if (id == 19) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAOZJREFUeNrt2UGKhDAURdEPWUCW5NazJBcgvB6oXalGWhCH5wxCCV5Hn5SpqgIAbrRk9BxGT8TiN+O+VS1rTUtGtf1R+6OTrap6kqxi8YM44+9lm6Z1f8wSsfhRXC1V/RzFUW36dOyHPakl2/XuKRbfxLWPZ0bfjv1QLH45zlq1f5Me98zxuQGKxY/ifQC3+f1tiMXvxfV9Lniye4rF/8TneGb8nhCGWPxefL6/fZbzB458x5cHUbH4Nm7T7CVryyc+h/dYxOIncdV898P/ncRiAAAAAAAAAAAAAAAAAAAAAAAAALj2A0MGgbIgdGM+AAAAAElFTkSuQmCC";
        if (id == 20) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAALtJREFUeNrt2D0OgyAAhmGSHoAjeXWOxAFMvg7+tKYLWtvpeQYXfJkIKKUAAIOmLhb/JU6SpJXH9qhJKTURi7+I0+r8HqeLxbfGyR73UsTiG+Opb+9M/RjXbAMRi6/HSZYZlm7fAJN1Zb4Wr1h8Pl6Hk7TjR9yS1CyzisWX4+10bccjdmx5isUDcZL5Ix45YsXisbjVPT73IyoWX4nHL9PE4qHrWgAAAAAAAAAAAAAAAAAAAAAAAACAH3gCd2rgY0y2j3EAAAAASUVORK5CYII=";
        if (id == 21) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAgMAAAAAulYGAAAACVBMVEUAAAD78jYAAAAbgqRaAAAAAnRSTlMAAHaTzTgAAAFbSURBVHja7dqxbsIwFAXQtCNf1yWemfkqZk/9ui5dmkIMjnlBqlQHWp0zRISArkikq+eQYQAAAIDWS/Rm/t6k9t3dcdp87H8p+PVRv1iwYMF/P/i2uaaCSuf6WrTUvFuOzkVWpEvhzaYP5+WB5BoLFiy4U3PVfbVoqRR02BBUleYSLFjwQ2euRjRzXTtsUVXNmlNzCRYsuHNzRaXV1NePmqvMZppLsGDB/ZurHrwWBVU318pqMbrt5RoLFiy462qxXhleN82y794d+mjXNRYsWPAWzVV2o1tX0UMS0WrRzCVYsODNg3M+zptV4/h252hKp87a5exUCxYsuN/MNcQPZt0MT2XmGofP9/Wv+W9RsGDBGwXPg9Lp1SHnenfvVAsWLPg5Z656qrq0mVMtWLDgZwkGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAID/4Qt4x2TBXZDUDQAAAABJRU5ErkJggg==";
        if (id == 22) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAANZJREFUeNrt2EFqhDAYhuEfPECO5NU9kgcQvi40mhkGOnVa6OJ5FkFJ3p3EaBUAAP/OlCRb1dyHJEkWsfjn8ZRkPa73pNq+Ns/xuU4sfjtuWx9qyjG0HMMQr1Vi8Z04yTLseL2rqv02EYs/ibeq+dwAl/54jlth78TiG3FN4+FsznYe4pJrViy+HVdlaVsl65TrQe27oFj8G3GfPuJ2vWfF4s/jh1dsjR+iQ/z6K1YsficeVz/8THuKX/+JE4u/jQEAAAAAAAAAAAAAAAAAAAAAAAAA/sgXeOoye3zRr8kAAAAASUVORK5CYII=";
        if (id == 23) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAKFJREFUeNrt2EEKgzAQQNEBD+CRenWP5AGEqY0xWKgVIoUu3lsETPJdBVEjAAD4L7mZh8wp9iFzEYu74iGP5g/xWGfE4p647X6ZysRYNh7jfU4s7ojXlSXWPe0R1+LthmLxvfjkeNaFeikWd8fleNbhLY5HeXUTi8VisVj8JT7/EBWLb8cXf+LE4ssYAAAAAAAAAAAAAAAAAAAAAAAAAOBHnicawGcBngT/AAAAAElFTkSuQmCC";
        if (id == 24) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAMJJREFUeNrt1sENgyAYgFGSDtCRurojOYAJBZRgoo3E4u29Q1sjnyf6SwgAwLVPTKb0I39HsXhwHOPcLl71MXP5yJfv8sxFLL4Vp9t5zbZR53J5Fp/uW7G4K257ryw8xuWGWHwnrgvL2Jt+DECx+I84HeKW9fy2LazHuesBKBb3xKHebqPwGC9BLL4br+/Z7e26G4o9A1As7nhL7onFo2N/SfHTM+zkECcWD4sBAAAAAAAAAAAAAAAAAAAAAAAAAJ7yBZ5ywvjsvmFlAAAAAElFTkSuQmCC";
        if (id == 25) return str = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEUAAAAAAAClZ7nPAAAAAXRSTlMAQObYZgAAAL1JREFUeNrt2EEOgjAQQNEmHIAjcXWOxAFIqi2liMSAoezeWyCY/FlNAA0BADg3xGQSi5+J45g/+rl+06Vhc5paDr9Hi8UncRcPZ31ciMVN4/ei5qVM8XIQi9vG5XIX54FicZt4mEq83gDL251YfD/OSxmO8RjE4hvx+jNhWLbw6wZ4sp5i8YV428KP7tojViy+FE/1/47jS9w6oc4Xi/+MdwsoFjePAQAAAAAAAAAAAAAAAAAAAAAAAAAe8wI/ynGmKa1vZwAAAABJRU5ErkJggg==";
    }
}

contract Rares {

    function rares(uint256 id) external pure returns (string memory str ) {
        if (id == 20) return str = "";
        if (id == 21) return str = "";
        if (id == 22) return str = "";
        if (id == 23) return str = "";
    }
    
}
