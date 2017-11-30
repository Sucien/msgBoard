package cs.cwnu.bean;

public class Page {
    private int curPage;
    private int maxPage;

    public int getTruePage(int curPage){
        if(curPage == 0){
            int truePage = curPage + 1;
            return truePage;
        }else{
            int truePage = (curPage/10)+1;
            return truePage;
        }
    }

    public int getCurrPage(int truePage){
        if (truePage == 1){
            int currPage = 0;
            return currPage;
        }else {
            int currpage = (truePage*10)-10;
            return currpage;
        }
    }

    public int getMaxxPage(int maxCount){
        int maxPage = maxCount/10;
        if(maxPage ==0 ){
            maxPage=maxPage+1;
            return maxPage;
        }else {
            return maxPage;
        }
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int setMaxPage(int maxPage) {
        this.maxPage = maxPage;
        return maxPage;
    }
}
