class Api::V1::McsInfosController < Api::V1::ApiController
    def index
        @mcs_infos = McsInfo.all
    end
end
